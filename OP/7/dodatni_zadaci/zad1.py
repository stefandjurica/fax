lista = [1, 2, 3, 4, 5, 6, 7, 8, 9]
n = len(lista)
lista1 = [lista[i] for i in range(n) if i == 0 or i == n-1]
lista2 = [lista[i] for i in range(n) if i == 0 or i == int(n/2) or i == n-1]
lista3 = [lista[i] for i in range(n) if i % 2 == 0]
print(lista)
print(lista1)
print(lista2)
print(lista3)
