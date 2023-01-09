-- Кількість віршів, написаних у конкретний період
SELECT author_name, COUNT(poem_name) AS number_of_poems
FROM poems
INNER JOIN authors ON poems.author_id = authors.author_id
GROUP BY author_name

-- Кількість віршів окремого автора
SELECT period_name, COUNT(poem_name) AS number_of_poems
FROM poems
INNER JOIN periods ON poems.genre_id = periods.period_id
GROUP BY period_name

-- Кількість віршів конкретного жанру
SELECT genre_name, COUNT(poem_name) AS number_of_poems
FROM poems
INNER JOIN genres ON poems.genre_id = genres.genre_id
GROUP BY genre_name
