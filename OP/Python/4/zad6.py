#unformatted = open('unformatted.txt', 'r')
#formatted = open('formatted.txt', 'w')


def rmspace(str_in):
    length = len(str_in)
    for i in range(length):
        if str_in[i] == " " and str_in[i-1] == " ":
            str_in = str_in[0:i-1:]+str_in[i::]
            length = length - 1
    return str_in


string = "daniloo    oo  "
string = rmspace(string)
print(string)
