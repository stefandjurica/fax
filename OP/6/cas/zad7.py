def uskrs(godina):
    godina = int(godina)
    a = godina % 19
    b = godina % 4
    c = godina % 7
    d = (19*a+24) % 30
    e = (2*b+4*c+6*d+5) % 7
    datum = 22 + d + e
    if godina == 1954 or godina == 1981 or godina == 2049 or godina == 2076:
        datum = datum + 7
    if datum > 31:
        datum = datum - 31
        print('datum je '+str(datum)+' april')
    else:
        print('datum je '+str(datum)+' mart')


god = input('unesi godinu')
uskrs(god)
