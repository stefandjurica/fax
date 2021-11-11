file1 = open('names.txt', 'r')
choice = ''


def search(ime):
    ime = ime.lower()
    ime = ime[0].upper() + ime[1::]
    n = 0
    for line in file1.readlines():
        if line[:-1] == ime:
            n = n+1
    print("Ime "+ime+" se pojavljuje " + str(n) + " puta")


def max():
    names = {}
    for line in file1.readlines():
        if line in names:
            names[line] = names[line] + 1
        if not line in names:
            names[line] = 1
    max_name = ''
    maks = 0
    for name in names:
        if names[name] > maks:
            maks = names[name]
            max_name = name
    print("Ime sa najvise pojavljivanja je: ", max_name)


while choice != 'a' and choice != 'b':
    choice = input(
        "Da li zelite pretraziti broj pojavljivanja imena (a), ili zelite naci ime sa najvise pojavljivanja (b)?   a/b >> ")
    if choice == 'a':
        ime = input("Unesite ime: ")
        search(ime)
        file1.close()
    if choice == 'b':
        max()
        file1.close()
