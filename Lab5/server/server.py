import socket
import random


sock = socket.socket()
sock.bind(('', 9090))
print("Server started")

sock.listen(1)
conn, addr = sock.accept()

print('Connected:', addr)

while True:
    data = conn.recv(1024)
    if not data:
        break
    client_number = int(data)
    server_number = random.randint(1, 6)

    if (server_number > client_number):
        conn.send(bytes(f"Defeat", 'utf8'))
    elif (server_number == client_number):
        conn.send(bytes(f"Draw", 'utf8'))
    else:
        conn.send(bytes(f"Victory", 'utf8'))

conn.close()