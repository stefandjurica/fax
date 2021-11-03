for i in range(1200, 2500, 1):
    if i % 7 == 0 or i % 11 == 0:
        print(i)
    if i % 1111 == 0:
        exit()
