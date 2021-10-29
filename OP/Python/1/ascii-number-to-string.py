word = input()
elements = word.split()
print(elements)
for wrd in elements:
    print(chr(int(wrd)), end=" ")

