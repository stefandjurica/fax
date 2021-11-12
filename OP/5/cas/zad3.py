file1 = open("users.txt", "r")
for user in file1.readlines():
    lista = user.split("|")
    print(lista)
file1.close()
