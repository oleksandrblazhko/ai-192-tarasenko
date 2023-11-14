## Крок 1

### Створіть у БД структури даних, необхідні для роботи повноважного керування доступом.

Було створено таблицю Access Levels

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/7fdced42-38ec-43e9-8da0-0bdbf942c6ef)

Та таблицю Groups Access Level

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/f5caa00b-a365-4566-bff9-aee1d3ad3587)

Далі було розмежовано права на таблицю groups_access_level

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/2f1a141e-0625-4ea2-bbc0-3da9eae26048)

## Крок 2

### Додайте до таблиці з даними стовпчик, який буде зберігати мітки конфіденційності. Визначте для кожного рядка таблиці мітки конфіденційності, які будуть різнитися (для кожного рядка своя мітка).

Було додано стовпець spot_conf, який містить мітки конфіденційності:

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/a3cf1818-83f9-4ddf-9e6d-0a8d92d083b3)

## Крок 3

### Визначте для користувача його рівень доступу.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/ef8b73c5-5206-48d9-973c-d9a82ee9d5ed)

## Крок 4

### Створіть нову схему даних, назва якої співпадає з назвою користувача.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/82aecdbb-f9be-4ebd-a514-aa7842395739)

## Крок 5

### Створіть віртуальну таблицю, назва якої співпадає з назвою реальної таблиці та яка забезпечує SELECT-правила повноважного керування доступом для користувача.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/17b6aeac-a362-46e0-b999-59d94900b166)

## Крок 6

### Створіть INSERT/UPDATE/DELETE-правила повноважного керування доступом для користувача.

Знімаємо права доступу до реальної таблиці та встановлюємо права доступу на віртуальну таблицю:

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/21b734e6-cbbc-4787-a5aa-432d4bdb879d)
![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/afbc7d3a-480a-48ff-8faa-613b02f05a61)

Перевіримо вміст реальної та віртуальної таблиць:

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/806cfdc7-850e-4281-8898-c4c37f26ebda)

Змінимо у одного елемента мітку конфіденційності:

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/7b85130c-191a-4497-aa49-2d7943fec71b)

Було створено правила повноважного керування доступом для користувача tarasenko

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/59648f94-ce9c-4525-ad90-7e6c0b0b6948)

## Крок 7

### Встановіть з’єднання з СКБД від імені нового користувача.

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/8d664af7-3121-4bb2-944d-46c5bcf89626)

## Крок 8

### Від імені нового користувача перевірте роботу механізму повноважного керування, виконавши операції SELECT, INSERT, UPDATE, DELETE

SELECT

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/ed2f5218-a967-4d45-8f53-873bdccfffa5)

INSERT

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/94da01d6-e975-468f-b87a-9deb4ae28a67)

UPDATE

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/98a3789a-88f0-406b-9469-b4e7ea842d00)

DELETE

![image](https://github.com/oleksandrblazhko/ai-192-tarasenko/assets/81381951/473d4150-9742-4bff-8016-b4a410c9634b)


