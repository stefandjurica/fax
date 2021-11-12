data = open('bank_log.txt', 'r')
users = {}
numberOfIncomes = {}

for lines in data.readlines():
    lines = lines[:-1]
    line = lines.split(' ')
    if line[1] == 'newaccount':
        users[line[0]] = 0
        numberOfIncomes[line[0]] = 0
    if line[1] == 'income':
        users[line[0]] = users[line[0]] + float(line[2])
        numberOfIncomes[line[0]] = numberOfIncomes[line[0]] + 1
    if line[1] == 'withdrawal':
        users[line[0]] = users[line[0]] - float(line[2])
print('''	a) Za zadatog korisnika odrediti stanje na računu.
        b) Pronaći korisnika koji ima najviše novca na računu
        c) Pronaći korisnika sa najvećim brojem uplata
        d) Pronaći korisnike čije je stanje na računu manje od unetog iznosa
        e) Pronaći sve korisnike čije ime počinje zadatim/unetim stringom
	f) Kreirati izveštaj stanja na računu za sve postojeće korisnike.''')
opcija = input('Unesite zeljenu opciju: ')

if opcija == 'a':
    user = input('Unesite korisnika: ')
    print('Stanje na racunu korisnika {:s} je: {:.2f}'.format(
        user, users[user]))
elif opcija == 'b':
    maks = 0
    maks_user = ''
    for i in users:
        if users[i] > maks:
            maks = users[i]
            maks_user = i
    print('Korisnik sa najvise novca na racunu je: ', maks_user)
elif opcija == 'c':
    maks = 0
    maks_user = ''
    for i in numberOfIncomes:
        if numberOfIncomes[i] > maks:
            maks = numberOfIncomes[i]
            maks_user = i
    print('Korisnik sa najvecim brojem uplata je: ', maks_user)
elif opcija == 'd':
    value = input('Unesite iznos: ')
    for i in users:
        if users[i] < float(value):
            print(i, end=', ')
elif opcija == 'e':
    string = input('Unesite string: ')
    for i in users:
        if i.startswith(string):
            print(i, end=', ')
elif opcija == 'f':
    for i in users:
        print('{:s}--->{:.2f}'.format(i, users[i]))
else:
    print('greska')
