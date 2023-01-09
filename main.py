import psycopg2


username = 'postgres'
password = '11111111'
database = 'strilchuk_BD'
host = 'localhost'
port = '5432'

query_1 = '''
SELECT period_name, COUNT(poem_name) AS number_of_poems
FROM poems
INNER JOIN periods ON poems.genre_id = periods.period_id
GROUP BY period_name
'''
query_2 = '''
SELECT author_name, COUNT(poem_name) AS number_of_poems
FROM poems
INNER JOIN authors ON poems.author_id = authors.author_id
GROUP BY author_name
'''

query_3 = '''
SELECT genre_name, COUNT(poem_name) AS number_of_poems
FROM poems
INNER JOIN genres ON poems.genre_id = genres.genre_id
GROUP BY genre_name
'''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)
with conn:
    cur = conn.cursor()
    print('Результат роботи програми main.py:')
    print('\nКількість віршів, написаних у конкретний період')
    cur.execute(query_1)
    for row in cur:
        print(*row)

    print('\nКількість віршів окремого автора')
    cur.execute(query_2)
    for row in cur:
        print(*row)
    
    print('\nКількість віршів конкретного жанру')
    cur.execute(query_3)
    for row in cur:
        print(*row)
