lista = [1, 3, 57, 5, 4, 22, 77, 8889, 43, 232, 0, 9, -1, -4, -1, 22]
n = len(lista)

for i in range(n):
    if lista[i] > 10:
        print(lista[i], end=' ')
print('\n')

for i in range(n):
    if lista[i] % 3 == 0:
        print(lista[i], end=' ')
print('\n')

lista2 = [lista[i]*lista[i] for i in range(n)]
print(lista2)

found = [0 for i in range(n)]


def uniquei(i):

    if lista.count(lista[i]) > 1 and found[i]:
        return False
    found[i] = 1
    return True


listaUnique = [lista[i] for i in range(n) if uniquei(i)]

print(listaUnique)
