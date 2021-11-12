file1 = open("unformatted.txt", "r")
file2 = open("formatted.txt", "w")


def rmspace(str):
    line = str.split(" ")
    out = ''
    for word in line:
        if word != '':
            out = out+word+' '
    return out


naslov = file1.readline()
naslov = naslov.lower()
naslov = rmspace(naslov)

flag = 1
for i in range(len(naslov)):
    if naslov[i].isalpha() and flag:
        naslov = naslov[:i] + naslov[i].upper() + naslov[i+1:]
        flag = 0
    if naslov[i] == ' ':
        flag = 1
naslov = '{:^100s}'.format(naslov)
file2.write(naslov)
file2.write("\n")

for lines in file1.readlines():
    file2.write("     " + rmspace(lines))

file1.close()
file2.close()
