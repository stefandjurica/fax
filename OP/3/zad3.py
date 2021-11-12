suma = 0
neparan = 0
unos = ""
while not neparan:
    unos = int(input("unesi broj: "))
    if unos % 2 == 1:
        neparan = 1
    else:
        suma = suma + unos
print("suma je: ", str(suma))
