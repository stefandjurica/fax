def uskrs(godina):
    godina = int(godina)
    if godina < 1982 or godina > 2048:
        print('godina nije u opsegu!')
        return
    a = godina % 19
    b = godina % 4
    c = godina % 7
    d = (19*a+24) % 30
    e = (2*b+4*c+6*d+5) % 7
    datum = 22 + d + e
    if datum > 31:
        datum = datum - 31
        print('datum je '+str(datum)+' april')
    else:
        print('datum je '+str(datum)+' mart')


god = input('unesi godinu')
uskrs(god)
