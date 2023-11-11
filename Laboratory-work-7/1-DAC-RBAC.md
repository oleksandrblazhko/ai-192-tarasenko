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


