string = input("unesi string: ")
string_split = string.split(" ")
for rijec in string_split:
    word = rijec[0]
    print(word.upper(),   end="")
