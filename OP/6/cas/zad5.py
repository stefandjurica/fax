def dadilja(od, do):
    od_sati = eval(od.split(':')[0])
    od_minuti = eval(od.split(':')[1])
    do_sati = eval(do.split(':')[0])
    do_minuti = eval(do.split(':')[1])
    minuti = 0
    minuti_preko_9 = 0
    while od_sati < do_sati or od_minuti < do_minuti:

        if od_minuti == 60:
            od_minuti = 0
            od_sati = od_sati + 1
        od_minuti = od_minuti + 1
        if od_sati >= 9:
            minuti_preko_9 = minuti_preko_9 + 1
        else:
            minuti = minuti + 1

    iznos = (minuti * 150/60) + (minuti_preko_9 * 100/60)
    print('plata je: ', iznos)


dadilja('18:35', '22:50')
