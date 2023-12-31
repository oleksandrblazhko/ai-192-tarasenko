# Огляд практики безпеки

Якщо у вашій організації запрацюють програми, ви, ймовірно, зіткнетеся з інцидентами безпеки. У цій моделі ми визначаємо інцидент безпеки як порушення або загрозу неминучого порушення принаймні одного з цілей безпеки активу через зловмисну ​​чи недбалу поведінку. Приклади інцидентів безпеки можуть включати: успішну атаку типу «відмова в обслуговуванні» (DoS) проти хмарної програми, користувач програми отримує доступ до особистих даних іншої особи, зловживаючи вразливістю системи безпеки, або зловмисник змінює вихідний код програми. Практика управління інцидентами (IM) зосереджена на роботі з ними у вашій організації.
Історично багато інцидентів безпеки виявляли через місяці або навіть роки після початкового порушення. Протягом «часу очікування» до виявлення інциденту може виникнути значна шкода, що ускладнить відновлення. Наш перший потік активності, виявлення інцидентів, зосереджується на зменшенні цього часу перебування.

Коли ви визначили, що ви постраждали від інциденту безпеки, важливо відреагувати дисципліновано та ретельно, щоб обмежити збитки та якомога ефективніше повернутися до нормальної роботи. Це ціль нашого другого потоку.

# Огляд потоків
### Потік A – Виявлення інцидентів

Виявлення інциденту стосується процесу визначення того, що ідентифікована подія, що стосується безпеки, насправді є інцидентом безпеки. Діяльність у цьому потоці зосереджена на здатності організації виявляти інциденти безпеки, коли вони відбуваються, та ініціювати відповідні заходи реагування на інциденти.

### Потік B – Реагування на інциденти
Реагування на інциденти починається з моменту, коли ви визнаєте та перевіряєте існування інциденту безпеки. Ваша мета — діяти злагоджено та ефективно, щоб максимально обмежити подальшу шкоду. Діяльність у цьому потоці зосереджена на здатності організації належним чином та ефективно реагувати на зареєстровані інциденти безпеки.

## Потік A – Виявлення інцидентів
### Рівень зрілості 1
#### Вигода

Можливість виявлення найбільш очевидних інцидентів безпеки

#### Діяльність
Аналізуйте доступні дані журналу (наприклад, журнали доступу, журнали програм, журнали інфраструктури), щоб виявити можливі інциденти безпеки відповідно до відомих періодів зберігання даних журналу. 
У невеликих установках ви можете зробити це вручну за допомогою звичайних інструментів командного рядка. При більших обсягах журналів використовуйте методи автоматизації.
Навіть робота «cron», яка запускає простий сценарій для пошуку підозрілих подій, є кроком вперед!
Якщо ви надсилаєте журнали з різних джерел до спеціальної системи агрегації журналів, проаналізуйте журнали там і використовуйте основні принципи кореляції журналів.
Навіть якщо у вас немає цілодобового процесу виявлення інцидентів, переконайтеся, що відсутність відповідальної особи (наприклад, через відпустку чи хворобу) не впливає суттєво на швидкість або якість виявлення. 
Встановіть і поділіться контактними особами для офіційного створення інцидентів безпеки.

#### Критерії якості
* У вас є контактна точка для створення інцидентів безпеки
* Ви аналізуєте дані відповідно до періодів зберігання даних журналу
* Частота цього аналізу залежить від критичності ваших програм

### Рівень зрілості 2
#### Вигода

Своєчасне та послідовне виявлення очікуваних інцидентів безпеки

#### Діяльність

Встановіть спеціалізованого власника для процесу виявлення інцидентів, зробіть чітку документацію доступною для всіх зацікавлених сторін процесу та забезпечте її регулярний перегляд і оновлення за необхідності. Переконайтеся, що працівники, відповідальні за виявлення інцидентів, дотримуються цього процесу (наприклад, за допомогою навчання). 
Процес зазвичай покладається на високий ступінь автоматизації, збираючи та співставляючи дані журналу з різних джерел, включаючи журнали програм. Ви можете збирати журнали в центральному місці, якщо це зручно. Періодично перевіряйте цілісність аналізованих даних. Якщо ви додаєте нову заявку, переконайтеся, що процес охоплює її протягом розумного періоду часу. 
Виявляйте можливі інциденти безпеки за допомогою доступного контрольного списку. Контрольний список має охоплювати очікувані вектори атак і відомі або очікувані ланцюжки знищення. Регулярно оцінюйте та оновлюйте його. 
Якщо ви визначите, що подія є інцидентом безпеки (з достатньо високою впевненістю), негайно повідомте відповідальний персонал, навіть у неробочий час. За потреби виконайте подальший аналіз і розпочніть процес ескалації.

#### Критерії якості
* У процесу є спеціальний власник
* Ви зберігаєте документацію процесу в доступному місці
* Процес розглядає шлях ескалації для подальшого аналізу
* Ви навчаєте цього процесу співробітників, відповідальних за виявлення інцидентів
* У вас є контрольний список потенційних атак, щоб спростити виявлення інцидентів

### Рівень зрілості 3
#### Вигода

Можливість своєчасного виявлення інцидентів безпеки

#### Діяльність

Переконайтеся, що документація процесу містить заходи щодо постійного вдосконалення процесу. Перевірте безперервність вдосконалення процесу (наприклад, шляхом відстеження змін). 
Переконайтеся, що контрольний список для виявлення підозрілих подій пов’язаний принаймні з (i) джерелами та базами знань поза компанією (наприклад, повідомлення про нові вразливості, що впливають на використовувані технології), (ii) минулими інцидентами безпеки та (iii) результатами моделі загроз. 
Використовуйте кореляцію журналів для виявлення інцидентів для всіх розумних сценаріїв інцидентів. Якщо дані журналу для виявлення інциденту недоступні, задокументуйте їх відсутність як дефект, сортуйте та обробіть це відповідно до встановленого процесу керування дефектами. 
Якість виявлення інциденту не залежить від часу чи дня події. Якщо події безпеки не підтверджуються та не вирішуються протягом зазначеного часу (наприклад, 20 хвилин), переконайтеся, що подальші сповіщення генеруються відповідно до встановленого шляху ескалації.

#### Критерії якості
* Ви проводите перевірки принаймні раз на рік
* Ви оновлюєте контрольний список потенційних атак зовнішніми та внутрішніми даними

## Потік B – Реагування на інциденти
### Рівень зрілості 1
#### Вигода
Здатність ефективно вирішувати більшість типових інцидентів безпеки
#### Діяльність
Першим кроком є ​​визнання компетентності реагування на інциденти як такої визначити відповідального власника. Забезпечте їм необхідний час і ресурси бути в курсі поточного стану передових практик обробки інцидентів і криміналістики оснащення. 
На цьому рівні зрілості ви, можливо, не створили спеціальної групи реагування на інциденти, але ви визначили учасників процесу (зазвичай різні ролі).
Призначте єдину контактну точку для процесу, відому всім відповідним зацікавленим сторонам. Переконайтеся, що контактна особа знає, як зв’язатися з кожним учасником, і визначте обов’язки за викликом для тих, хто їх має. 
Коли трапляються інциденти безпеки, документуйте всі вжиті дії. Захистіть цю інформацію від несанкціонованого доступу.

#### Критерії якості
* У вас є визначена особа або роль для обробки інцидентів
* Ви документуєте інциденти безпеки

### Рівень зрілості 2
#### Вигода
Розуміння та ефективне вирішення більшості інцидентів безпеки
#### Діяльність
Створіть і задокументуйте офіційний процес реагування на інцидент безпеки. Переконайтеся, що документація містить інформацію, наприклад and#58:
* найімовірніші/поширені сценарії інцидентів безпеки та інструкції високого рівня щодо їх обробки; для таких сценаріїв також використовуйте загальнодоступні відомості про можливі відповідні інциденти третіх сторін;
* правила сортування кожного інциденту;
* правила залучення різних зацікавлених сторін, включаючи вище керівництво, зв’язки з громадськістю, юридичний відділ, відділ конфіденційності, кадрові ресурси, зовнішні (правоохоронні) органи та клієнтів; вказати обов’язковий термін для цього, якщо необхідно; 
* процес виконання аналізу першопричини та документування його результатів.

Переконайтеся, що обізнана та належним чином навчена група реагування на інциденти доступна як у робочий час, так і поза ним. Визначте часові рамки для дій і бойову кімнату. Підтримуйте апаратні та програмні засоби в актуальному стані та готові до використання в будь-який час.

#### Критерії якості
* У вас є узгоджена класифікація інциденту
* Процес розглядає аналіз основних випадків для інцидентів високої серйозності
* Співробітники, відповідальні за реагування на інциденти, навчаються цьому процесу
* Доступний інструментарій криміналістичного аналізу

### Рівень зрілості 3
#### Вигода
Ефективне реагування на інцидент незалежно від часу, місця чи типу інциденту
#### Діяльність
Створіть спеціальну групу реагування на інциденти, яка буде постійно доступною та відповідатиме за постійне вдосконалення процесів за допомогою регулярних RCA. Для розподілених організацій визначте та задокументуйте правила логістики для всіх відповідних місць, якщо це розумно.
Задокументуйте детальні процедури реагування на інциденти та оновлюйте їх. Автоматизуйте процедури, де це необхідно. Тримайте всі ресурси, необхідні для цих процедур (наприклад, окрему комунікаційну інфраструктуру або надійне зовнішнє розташування), готовими до використання. Своєчасно виявляти та виправляти відсутність цих ресурсів.
Регулярно проводити протиаварійні та протиаварійні навчання. Використовуйте результати для вдосконалення процесу.
Визначайте, збирайте, оцінюйте та реагуйте на показники процесу реагування на інциденти, включаючи його постійне вдосконалення.

#### Критерії якості
* Команда виконує аналіз першопричини для всіх інцидентів безпеки, якщо немає конкретної причини не робити цього
* Ви переглядаєте та оновлюєте процес відповіді принаймні раз на рік
