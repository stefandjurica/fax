
def a():

    n = eval(input("Koliko brojeva zelite >> "))
    broj = 0
    prosek = 0
    for i in range(n):
        broj = eval(input("Unesite broj: "))
        prosek = prosek + broj
    out = prosek/n
    print("Prosek je: %.2f" %(out))

def b():
    broj = eval(input("Unesite broj: "))
    prosek = broj
    n = 1
    da_ne = input("Jos? ")
    while da_ne == "Da":
        broj = eval(input("Unesite broj: "))
        prosek = prosek + broj
        da_ne = input("Jos? ")
        n = n+1
    prosek = prosek/n
    print("Prosek je: %.2f" %(prosek))

def c():
    prosek = 0
    n = 0
    while 1:
        broj = input("uneste broj(ili 'x' za kraj): ")
        if broj == "x":
            n = n+1
            break
        prosek = prosek + int(broj)
        n = n+1
    prosek = prosek/n
    print("Prosek je: %.2f" %(prosek))
c()



