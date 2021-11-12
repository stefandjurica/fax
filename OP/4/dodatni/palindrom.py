string = 'anavolimilovana'
n = int(len(string)/2)
length = len(string)
for i in range(n):
    if string[i] != string[length - 1 - i]:
        print("nije palindrom!")
        exit()
print("palindrom je")
