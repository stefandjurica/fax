def users(username, password, file_name, delimiter):
    file1 = open(file_name, "r+")
    file1.write(username+delimiter+password+"\n")
    file1.close()
    file1 = open(file_name, "r")
    for kor in file1.readlines():
        user = kor.split(delimiter)
        user[1] = user[1][:-1]
        print(user)
    file1.close()


users('danilo', 'danilo1', 'danilo.txt', '|')
