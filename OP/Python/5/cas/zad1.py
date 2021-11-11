import math


def solve(a, b, c):
    det = math.sqrt(b*b - 4*a*c)
    x1 = (-b + det)/2*a
    x2 = (-b - det)/2*a
    return x1, x2


a = eval(input("unesi prvi koeficijent"))
b = eval(input("unesi drugi koeficijent"))
c = eval(input("unesi treci koeficijent"))
print(solve(a, b, c))
