file1 = open('users.txt', 'r+')
for line in file1.readlines():
    user_name = line.split("|")
    print("Korisnicko ime: ", user_name[0])
    print("Lozinka: ", user_name[1])
    print(" ")
