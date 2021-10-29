#program za random broj 
import random
print("Potrebno je da unesete gornju i donju granicu broja kojji ce se generisati.")
gornja_granica= eval(input("gornja_granica: "))
donja_granica = eval(input("donja_granica: "))


if donja_granica > gornja_granica:
    print("greska, donja granica je veca od gornje")
    exit()
a = random.randint(donja_granica, gornja_granica)
br_pokusaja = 0
b = 0
end = 0
print("Generisan je jedan nasumican broj izmedju", donja_granica, "i", gornja_granica, " Pokusajte pogoditi generisani broj: ")
def check(num):
    if num<donja_granica or num > gornja_granica:
        print("Izlazak iz opsega!")
        end = 1
while  not end: 
    b = int(input())
    check(b)
    if end == 1:
        break
    br_pokusaja = br_pokusaja + 1
   
    if b == a:
        print("Cestitam pogodili ste broj!")
        print("Broj pokusaja: ", br_pokusaja)
        end = 1
    elif b < a:
        print("Uneti broj je manji od generisanog. Pokusajte ponovo: ")
        continue
    else:
        print("Uneti broj je veci od generisanog. Pokusajte ponovo: ")
        continue
