import socket
import time
import random


sock = socket.socket()
sock.connect(('server', 9090))
while True:
    client_number = random.randint(1, 6)
    print(f"My number is {client_number}")
    sock.send(bytes(str(client_number), 'utf8'))

    data = sock.recv(1024)

    print(data)
    time.sleep(1)

sock.close()
