#unformatted = open('unformatted.txt', 'r')
#formatted = open('formatted.txt', 'w')


def rmspace(str_in):
    length = len(str_in)
    space = 0
    for i in range(length):
        if str_in[i] == " " and space == 1:
            str_in[i] = str_in[:i]+str_in[i+1::]


string = "daniloo    oo  "
string = rmspace(string)
print(string)
