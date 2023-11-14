## Крок 1

### Встановіть СКБД PostgreSQL

PostgreSQL вже було встановлено.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/0b524ce9-2760-425c-81be-2c400a0afe76)

## Крок 2

### Створіть термінальну консоль psql через утиліту командного рядка вашої ОС та встановіть з’єднання з БД postgres від імені користувача-адміністратора postgres

Було встановлено з’єднання з БД postgres від імені користувача-адміністратора postgres

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/23bd7a8f-555f-4856-8133-f5922672f3de)

## Крок 3

### Зареєструйте нового користувача в СКБД PostgreSQL, назва якого співпадає з вашим прізвищем, наприклад blazhko, і довільним паролем.

Було створено користувача tarasenko з паролем '12345678' командою CREATE USER tarasenko WITH PASSWORD '12345678'. Командою \du перевірено наявність створеного користувача

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/c87a7ecb-ac9b-4a2a-bde7-086b0ce1380f)

## Крок 4

### Створіть роль в СКБД PostgreSQL (назва співпадає з вашим прізвищем латинськими літерами) і надайте новому користувачеві можливість наслідувати цю роль.

Роль tarasenko було створено автоматично після створення користувача

## Крок 5

### Створіть реляційну таблицю з урахуванням варіанту з таблиці 2.1 від імені користувача-адміністратора.

Було створено таблицю university командою Create table university (u_id integer, name varchar, year integer); . За допомогою \dt було перевірено наявність таблиці

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/ed151068-1be3-4d60-bbae-cc4b5779a57f)


## Крок 6

### Внесіть один рядок в таблицю, використовуючи команду insert into ..., відповідно до варіанту.

Було внесено один рядок до створеної таблиці за допомогою команди Insert into university values (1, 'ONPU', 1918); Та за допомогою команди SELECT * FROM university перевірено правильність введення

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/cd8cbc80-f058-4314-b43c-2bb6583b9467)

## Крок 7

### Додатково створіть ще одну термінальну консоль psql та встановіть з’єднання з БД postgres від імені нового користувача.

Було створено ще одну термінальну консоль psql та  встановлено з’єднання з БД postgres від імені користувача tarasenko

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/8b53a70b-f637-4b83-a247-4e9bfa1bb26e)

## Крок 8

### Від імені нового користувача виконайте запит на отримання даних з таблиці (select * from таблиця). Запротоколюйте результат виконання команди.

Командою SELECT * FROM university; виконано запит на отримання даних з таблиці. Як бачимо, користувач tarasenko не має доступу до таблиці.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/c89523f7-1ef7-4b00-a4c0-2aabdedfd06d)

## Крок 9

### Встановіть повноваження на читання таблиці новому користувачеві.

Командою GRANT SELECT ON university TO tarasenko; було надано повноваження.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/8f4da944-4a6c-4c4b-ac36-b3a12e6408f5)

## Крок 10

### Повторіть крок 8.

Оскільки тепер користувач tarasenko має доступ, то командою SELECT * FROM university; було отримано дані з таблиці university

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/2eea79e9-61ef-42f0-84c1-a841eaa35eba)

## Крок 11

### Зніміть повноваження на читання таблиці для нового користувача.

Командою REVOKE SELECT ON university FROM tarasenko; для користувача tarasenko знято повноваження на читання таблиці university.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/efdf19eb-520b-48dc-ac19-817291e77812)

## Крок 12

### Повторіть крок 8.

Як бачимо, доступу до читання таблиці немає

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/53bff804-d1ab-491a-9153-bc62d85ed9b4)

## Крок 13

### Створіть команду оновлення даних таблиці (UPDATE) і виконайте її від імені нового користувача. Проаналізуйте результат виконання команди.

Спробуємо оновити дані в таблиці командою UPDATE university SET name = 'NUOP' WHERE u_id = 1;. Як бачимо, прав на оновлення у користувача tarasenko немає.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/ed46437d-5243-40ee-9ac1-0c6683100c55)

## Крок 14

### Встановіть повноваження на оновлення таблиці новому користувачу.

Командою GRANT UPDATE ON university TO tarasenko для користувача tarasenko надано повноваження на оновлення таблиці university.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/670d767a-edfe-4209-8722-079d303e8c3e)

## Крок 15

### Повторіть крок 13.


![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/c7785a96-cf9d-4f4c-8f60-bb2f5ee46100)

## Крок 16

### Створіть команду видалення запису таблиці (DELETE) і виконайте її від імені нового користувача. Проаналізуйте результат виконання команди.

Повноваження для видалення даних з таблиці відсутні.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/766ad245-a58c-41c0-9cbc-a41436248a67)

## Крок 17

### Встановіть повноваження на видалення таблиці новому користувачеві.

Командою GRANT DELETE ON university TO tarasenko для користувача tarasenko надано повноваження на видалення рядків з таблиці university.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/28c55c11-6016-4c26-8c48-a054f2968e97)

## Крок 18

### Повторіть крок 16.

Успішне видалення

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/4e19982e-73bb-4a40-88c4-b5a2cd935ec4)

## Крок 19

### Зніміть всі повноваження з таблиці для нового користувача.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/e5ea0d90-e131-48f1-af89-4bbfdff8f87b)

## Крок 20

### Створіть команду внесення запису в таблицю (INSERT) і виконайте її від імені нового користувача. Проаналізуйте результат виконання команди.

Повноваження для додавання даних у таблицю відсутні.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/54d9c40d-0352-459d-a02a-639f50cab749)

## Крок 21

### Встановіть повноваження на внесення даних до таблиці для ролі.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/085ceeb4-ac19-4292-83b8-b78eb1187786)

## Крок 22

### Повторіть крок 20.

Успішне додавання даних

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/92261fbe-c2f5-4265-8641-7456c99a0ce1)

Перевірка за допомогою SELECT * FROM university

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/0d6fbec1-f64c-42fc-a4fa-6828f11f6414)





