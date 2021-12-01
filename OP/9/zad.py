posiljke = {}
posiljke[1] = ('Dositeja Obradovica 12', 340.56)
posiljke[32] = ('Vuka Karadzica 11', 4432.44)
posiljke[12] = ('Sime Milosevica 8', 32.66)
posiljke[99] = ('Trg Slobode 9', 999.99)
posiljke[33] = ('Jevrejska 22', 43.33)
posiljke[51] = ('Bulevar Oslovodjenja 22', 550.90)
posiljke[21] = ('Dositeja Obradovica 12', 9000.00)

# meni = {'1': min_posiljka(),
#   '2': ukupna_vr,
#   '3': vr_za_adrese,
#   '4': most_popular
#       }
print('Unesite zeljenu opciju: \n1. Posiljka sa najmanjom vrednoscu\n2. Ukupna vrednost poslata na adresu\n3. Ukupna vrednost za vise adresa\n4. Najpopularnija adresa')


def min_posiljka():
    min_p = posiljke[1][1]
    min_id = 1
    for i in posiljke:
        if min_p > posiljke[i][1]:
            min_p = posiljke[i][1]
            min_id = i
    print('Posiljka sa najmanjim vrednoscu je: ' + str(min_id) +
          ' |'+str(posiljke[min_id][0])+'|'+str(posiljke[min_id][1]) + ' EUR')


def ukupna_vr(a):
    if a != '':
        adresa = input('Unesite adresu ')

    adresa = a
    value = 0
    for i in posiljke:
        if posiljke[i][0] == adresa:
            value = value + posiljke[i][1]

    print('Ukupna vrednost poslata na adresu je: ', value)


def vr_za_adrese():
    while True:
        inp = input(
            'Unesite adresu za koju zelite pogledati vrednost ili "x" za prekid')
        if inp == 'x':
            break
        else:
            ukupna_vr(inp)


def most_popular():
    adrese = {}
    max_p = 0
    max_index = ''
    for i in posiljke:
        if posiljke[i][0] in adrese:
            adrese[posiljke[i][0]] = adrese[posiljke[i][0]] + posiljke[i][1]
        else:
            adrese[posiljke[i][0]] = posiljke[i][1]
            max_v = posiljke[i][1]
    for i in adrese:
        if adrese[i] > max_p:
            max_index = i
            max_p = adrese[i]
    print('Najpopularnija adresa je ' + max_index)


min_posiljka()
most_popular()
ukupna_vr('m')
