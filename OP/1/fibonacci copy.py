n = eval(input("unesi n: "))
fib = 1
broj1 = 1
broj2 = 1
if n==1 or n==2:
    print("rezultat = 1")
else:
    for i in range(3, n+1, 1):
        fib = broj1 + broj2
        broj2 = broj1
        broj1 = fib
    print("rezultat je", fib)