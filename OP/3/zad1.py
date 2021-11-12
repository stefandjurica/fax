
def star():
    for i in range(5):
        for j in range(i+1):
            print("*", end="")
        print(" ")
    for i in range(4, 0, -1):
        for j in range(i):
            print("*", end="")
        print(" ")


def e():

    for i in range(5):
        print("*", end="")
    print(" ")
    print("*")
    print("*")
    for i in range(4):
        print("*", end="")
    print(" ")
    print("*")
    print("*")
    for i in range(5):
        print("*", end="")


def a():
    print("%4s" % ("***"))
    for i in range(6):
        if i != 2:
            print("%-4s%s" % ("*", "*"))
        else:

            print("*****")


a()
