from mysql.connector import connect

conn = connect(
    host="localhost",        
    user="root",     
    password="Senha@1234",
    database="SpotifyClone"
)

if conn.is_connected():
    print('oi')