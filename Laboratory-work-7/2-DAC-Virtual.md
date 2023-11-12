## Крок 1
### Заповніть таблицю БД ще трьома рядками.

Було заповнено таблицю

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/a611599a-23f1-4a4d-82f3-0e0323b72dc7)

Та перевірено правильність заповнення

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/8f781792-5ae3-49a1-ac39-52280c2f2efb)

## Крок 2
### Створіть схему даних користувача, назва якої співпадає з назвою користувача, та створіть віртуальну таблицю у цій схемі з правилами вибіркового керування доступом для користувача так, щоб він міг побачити тільки деякі з рядків таблиці з урахуванням одного значення її останнього стовпчика.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/019e5807-cdb0-4628-9fa1-2ad11fb5bf90)

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/c5734d59-7db8-4ff0-a00d-4319ee8469f7)

## Крок 3

### Встановіть з’єднання з СКБД від імені нового користувача

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/afa80507-7ced-4ddc-a009-6c745dad1e1e)

## Крок 4

### Перевірте роботу механізму вибіркового керування, виконавши операцію SELECT до віртуальної таблиці.

Як видно з рисунка нижче, користувач tarasenko має доступ лише до рядків, у яких останній стовпець (year) дорівнює 1920.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/3670824b-137e-4e96-ba6a-be2a625ce621)


## Крок 5

### Створіть INSERT/UPDATE/DELETE-правила обробки операцій редагування віртуальної таблиці.

На рисунку нижче видно, що операції INSERT/UPDATE/DELETE виконати не можна

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/efe38200-c1a1-42ca-9429-0c7ef2f01f93)

Тому були створені наступні правила

INSERT

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/68b7ecd8-28b3-463b-9f0c-82b4d0c22e86)

UPDATE

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/2c92c2e6-c7df-4719-9d30-95bc6bbde88a)

DELETE

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/9354ac46-6eb9-42cf-8fd7-f3223dbd6a12)

