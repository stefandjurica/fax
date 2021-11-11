import linecache
import random
import os
import hangdraw

word = linecache.getline('dictionary.txt', random.randint(0, 267752))
print(word)
lenght = len(word)-1
letters = []
line = []
guess = []
game = 0
input_let = ''
error = 0
for i in range(lenght):
    letters.append(word[i])
    line.append('_')
    guess.append(0)


def cls():
    os.system('cls' if os.name == 'nt' else 'clear')


def checkIfWin():
    if not '_' in line:
        return 1
    else:
        return 0


def newLetter():
    global input_let
    input_let = input('\nUnesite slovo: ')
    if len(input_let) != 1 or (not input_let.isalpha()):
        input_let = ''
    input_let = input_let.upper()


def checkLetter():
    global error
    if input_let != '':
        found = 0
    else:
        found = 1
    for i in range(lenght):
        if input_let == letters[i]:
            guess[i] = 1
            found = 1
    if found == 0:
        error = error + 1


def draw_line():
    line_center = ''
    for i in range(lenght):
        if guess[i] == 1 and line[i] == '_':
            line[i] = letters[i]
        line_center = line_center + line[i] + ' '
    print('{:^40s}'.format(line_center))
    #print('{:^35s}'.format('\n Unesite slovo: '))


def draw():
    global error
    cls()
    print('{:-^40s}'.format("HANGMAN"))
    if error == 0:
        hangdraw.greska0()
    if error == 1:
        hangdraw.greska1()
    if error == 2:
        hangdraw.greska2()
    if error == 3:
        hangdraw.greska3()
    if error == 4:
        hangdraw.greska4()
    if error == 5:
        hangdraw.greska5()
    if error >= 6:
        hangdraw.greska6()
        if ans != 'godmode':
            for i in range(lenght):
                guess[i] = 1
            draw_line()
            print('{:-^40s}'.format('Zao nam je izgubili ste!'))
            exit()
    draw_line()

    if checkIfWin():
        print('{:-^40s}'.format('Cestitamo pobedili ste!'))
        exit()


print('{:-^40s}'.format("Dobrodosli u Hangman!"))
ans = input('Da li zelite zapoceti novu igru?   da/ne >> ')
if ans != 'da' and ans != 'godmode':
    exit()


while 1:
    draw()
    newLetter()
    checkLetter()
