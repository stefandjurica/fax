string1 = "Kockica"
string2 = "Kokos"
str1_len = int((len(string1)-1)/2)
str2_len = int((len(string2)-1)/2)
str = string1[0]+string2[0]+string1[str1_len] + \
    string2[str2_len]+string1[-1]+string2[-1]
print(str)
