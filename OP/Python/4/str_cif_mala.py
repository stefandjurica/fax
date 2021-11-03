string = "JA SAM DANILO 232312 diffda"
cifre = ""
mala_slova = ""
for char in string:
    if char.isdigit():
        cifre = cifre+char
    if char.islower():
        mala_slova = mala_slova + char
print("cifre su: ", cifre)
print("mala slova su: ", mala_slova)
