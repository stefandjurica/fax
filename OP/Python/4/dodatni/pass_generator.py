import random
char_list = []


def char_append(start, stop):
    for i in range(start, stop, 1):
        char_list.append(i)


n = eval(input("Unesite duzinu lozinke: "))
while n < 7:
    print("Lozinka je prekratka!")
    n = eval(input("Unesite duzinu lozinke: "))
char_append(33, 58)
char_append(65, 91)
char_append(97, 123)
password = ''

for i in range(n):
    char = random.choice(char_list)
    password = password + chr(char)
print("Generisana lozinka je: ", password)
