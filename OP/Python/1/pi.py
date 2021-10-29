n = eval(input("unesi n: "))
pi = 0
temp = 1
for i in range(n):
    pi = pi + 4/temp
    temp = (temp + 2)* -1
print("pi=", pi)