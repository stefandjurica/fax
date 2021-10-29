import random
gornja_granica = eval(input("unesi gornju granicu: "))
donja_granica = eval(input("unesi donju granicu: "))
if donja_granica > gornja_granica:
    print("Greska, donja granica je veca od gornje!!!")
    exit()
pogodak = 0
while not pogodak:
    a = random.randint(donja_granica, gornja_granica)
    print("Da li je", a, "vas zamisljeni broj?  da/ne")
    odgovor = input()
    if odgovor == "da":
        print("Kompjuter je pogodio vas broj!")
        pogodak = 1
    elif odgovor == "ne":
        print("Vise srece drugi put!")
    else:
        print("greska")
        continue
