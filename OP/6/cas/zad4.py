def kazna(brzina, granica):
    iznos = 5000
    if brzina >= 120 and granica < brzina:
        iznos = iznos + 10000
    if granica < brzina:
        for i in range(granica, brzina):
            iznos = iznos + 500
        print('Kazna je: ', iznos)
    else:
        print('Sve je u redu')


kazna(130, 60)
