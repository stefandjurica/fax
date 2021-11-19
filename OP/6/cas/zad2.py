def ocena(br_bodova):
    if br_bodova <= 54 and br_bodova >= 0:
        return 5
    elif br_bodova >= 55 and br_bodova <= 64:
        return 6
    elif br_bodova >= 65 and br_bodova <= 74:
        return 7
    elif br_bodova >= 75 and br_bodova <= 84:
        return 8
    elif br_bodova >= 85 and br_bodova <= 94:
        return 9
    elif br_bodova >= 95 and br_bodova <= 100:
        return 10


bodovi = eval(input("unesi bodove: "))
print('ocena je: ', ocena(bodovi))
