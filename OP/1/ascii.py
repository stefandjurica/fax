greet = input()
n = len(greet)
for i in range(n):
    print(greet[i], "=", ord(greet[i]))
print("done")