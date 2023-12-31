## Опис
Фіксація сеансу вмикається небезпечною практикою збереження однакового значення файлів cookie сеансу до та після автентифікації. Зазвичай це трапляється, коли сеансові файли cookie використовуються для збереження інформації про стан ще до входу, наприклад, для додавання товарів у кошик для покупок перед автентифікацією для оплати.

У загальному застосуванні вразливості фіксації сеансу зловмисник може отримати набір файлів cookie сеансу з цільового веб-сайту без попередньої автентифікації. Потім зловмисник може примусово завантажувати ці файли cookie у браузер жертви за допомогою різних методів. Якщо жертва пізніше автентифікується на цільовому веб-сайті, а файли cookie не оновлюються під час входу, жертву буде ідентифіковано за файлами cookie сеансу, вибраними зловмисником. Потім зловмисник може видати себе за жертву за допомогою цих відомих файлів cookie.

Цю проблему можна вирішити, оновивши файли cookie сеансу після процесу автентифікації. Крім того, атаку можна запобігти, забезпечивши цілісність файлів cookie сеансу. Розглядаючи мережевих зловмисників, тобто зловмисників, які контролюють мережу, яку використовує жертва, використовуйте повний HSTS або додайте префікс __Host- / __Secure- до імені файлу cookie.

Повне впровадження HSTS відбувається, коли хост активує HSTS для себе та всіх своїх субдоменів. Це описано в статті Стефано Кальзавари, Альвізе Рабітті, Алессіо Рагаццо та Мікеле Буглієзі під назвою «Тестування недоліків цілісності у веб-сесіях».

## Цілі тесту
+ Проаналізуйте механізм автентифікації та його потік.
+ Примусово встановіть файли cookie та оцініть вплив.

## Як тестувати
У цьому розділі ми пояснюємо стратегію тестування, яку буде показано в наступному розділі.

Перший крок – зробити запит на сайт, який потрібно перевірити (наприклад, www.example.com). Якщо тестувальник запитує наступне:

```
GET / HTTP/1.1
Host: www.example.com
```
Вони отримають таку відповідь:
```
HTTP/1.1 200 OK
Date: Wed, 14 Aug 2008 08:45:11 GMT
Server: IBM_HTTP_Server
Set-Cookie: JSESSIONID=0000d8eyYq3L0z2fgq10m4v-rt4:-1; Path=/; secure
Cache-Control: no-cache="set-cookie,set-cookie2"
Expires: Thu, 01 Dec 1994 16:00:00 GMT
Keep-Alive: timeout=5, max=100
Connection: Keep-Alive
Content-Type: text/html;charset=Cp1254
Content-Language: en-US
```
Програма встановлює новий ідентифікатор сеансу JSESSIONID=0000d8eyYq3L0z2fgq10m4v-rt4:-1 для клієнта.

Далі, якщо тестер успішно автентифікується в програмі за допомогою наступного POST на https://www.example.com/authentication.php:
```
POST /authentication.php HTTP/1.1
Host: www.example.com
[...]
Referer: http://www.example.com
Cookie: JSESSIONID=0000d8eyYq3L0z2fgq10m4v-rt4:-1
Content-Type: application/x-www-form-urlencoded
Content-length: 57

Name=Meucci&wpPassword=secret!&wpLoginattempt=Log+in
```
Тестер спостерігає таку відповідь від сервера:
```
HTTP/1.1 200 OK
Date: Thu, 14 Aug 2008 14:52:58 GMT
Server: Apache/2.2.2 (Fedora)
X-Powered-By: PHP/5.1.6
Content-language: en
Cache-Control: private, must-revalidate, max-age=0
X-Content-Encoding: gzip
Content-length: 4090
Connection: close
Content-Type: text/html; charset=UTF-8
...
HTML data
...
```

Оскільки після успішної автентифікації не було видано нових файлів cookie, тестувальник знає, що можливе викрадення сеансу, якщо не буде забезпечено цілісність файлу cookie сеансу.

Тестер може надіслати дійсний ідентифікатор сеансу користувачеві (можливо, використовуючи трюк соціальної інженерії), дочекатися його автентифікації та згодом перевірити, чи привілеї були призначені цьому файлу cookie.

### Тестування з примусовими файлами cookie
Ця стратегія тестування націлена на мережевих зловмисників, тому її потрібно застосовувати лише до сайтів без повного впровадження HSTS (сайти з повним впровадженням HSTS безпечні, оскільки всі їхні файли cookie мають цілісність). Ми припускаємо, що на веб-сайті, що тестується, є два облікові записи для тестування: один — жертва, а другий — зловмисник. Ми симулюємо сценарій, коли зловмисник примусово вставляє у браузер жертви всі файли cookie, які не були нещодавно створені після входу та не мають цілісності. Після входу жертви зловмисник надає веб-сайту примусові файли cookie для доступу до облікового запису жертви: якщо їх достатньо для дій від імені жертви, можлива фіксація сесії.

Ось кроки для виконання цього тесту:
1) Перейдіть на сторінку входу на веб-сайті.
2) Збережіть знімок файлу cookie перед входом, за винятком файлів cookie, які містять у своєму імені префікс __Host- або __Secure-.
3) Увійдіть на веб-сайт як жертва та перейдіть на будь-яку сторінку, яка пропонує безпечну функцію, що вимагає автентифікації.
4) Встановіть банку печива на знімок, зроблений на кроці 2.
5) Запустіть функцію безпеки, визначену на кроці 3.
6) Перевірте, чи успішно виконано операцію на кроці 5. Якщо так, то атака була успішною.
7) Очистіть банку файлів cookie, увійдіть як зловмисник і перейдіть на сторінку на кроці 3.
8) Запишіть у банку печива одне за одним печиво, збережене на кроці 2.
9) Знову запустіть безпечну функцію, визначену на кроці 3.
10) Очистіть банку з печивом і знову увійдіть як жертва.
11) Перевірте, чи успішно виконано операцію на кроці 9 в обліковому записі жертви. Якщо так, то атака була успішною; інакше сайт захищений від фіксації сесії.
Ми рекомендуємо використовувати дві різні машини або браузери для жертви та зловмисника. Це дозволяє зменшити кількість помилкових спрацьовувань, якщо веб-програма виконує відбитки пальців, щоб перевірити доступ, увімкнений із певного файлу cookie. Коротший, але менш точний варіант стратегії тестування вимагає лише одного тестового облікового запису. Він виконує ті самі кроки, але зупиняється на кроці 6.

## Виправлення
Реалізуйте поновлення маркера сеансу після успішної автентифікації користувача.

Перед автентифікацією користувача програма завжди повинна спочатку робити недійсним існуючий ідентифікатор сеансу, а якщо автентифікація пройшла успішно, надати інший ідентифікатор сеансу.
