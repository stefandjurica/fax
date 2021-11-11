string1 = input("unesi prvi string: ")
string2 = input("unesi drugi string: ")
if len(string1)<3 or len(string2)<3:
    print("greska")
    exit()

string2_len = len(string2)
string_out = 2*(string1[0:3])+string2[string2_len-3:string2_len]
print(string_out)