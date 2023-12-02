import psycopg2

try:
    connection = psycopg2.connect(
        user="postgres",
        password="12345",
        host="localhost",
        database="zoo"
    )
except:
    print('Can`t establish connection to database')


