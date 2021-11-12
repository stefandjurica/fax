months = ['januar', 'februar', 'mart', 'april','maj', 'jun', 'jul', 'avgust', 'septembar', 'oktobar', 'novembar', 'decembar' ]
inp = input("unesi dd.mm.yyyy")
date_seg = inp.split(".")
n = int(date_seg[1])
print(date_seg[0], '.', months[n-1], '.', date_seg[2])