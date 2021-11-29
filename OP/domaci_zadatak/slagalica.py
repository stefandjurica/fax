# 3 igre iz slagalice :: ko zna zna :: asocijacije  ::  spojnice
import random
import os
import time

# files:
ifile1 = open(
    'koznazna.txt', 'r', encoding='utf-8')
ifile2 = open(
    'asocijacije.txt', 'r', encoding='utf-8')
ifile3 = open(
    'spojnice.txt', 'r', encoding='utf-8')
# globals:
points = 0  # global points
apoints = 100  # max asocijacije points, getting lower after each opened answer
userIn = ''
correct = -1
winA = 0
cols = {'a': 0, 'b': 1, 'c': 2, 'd': 3, 'e': 4, 'f': 5,
        'g': 6, 'h': 7}  # dict for connecting indexes and bullets
kon = ''
attempts = 0
bullets = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']  # prefixes for questions
focus = 0  # shows current spojnice line


def cls():
    # clearing screen between each drawing function
    os.system('cls' if os.name == 'nt' else 'clear')


# init:
questions = [line.strip('\n') for line in ifile1 if line != '\n']
random.shuffle(questions)
columns = [line.strip('\n') for line in ifile2 if line != '\n']
n = random.randrange(0, int(len(columns))/5)
n = n*5
pairs = [line.strip('\n') for line in ifile3 if line != '\n']
m = random.randrange(0, int(len(pairs)/9))
m = m * 9
column1 = []
column2 = []
columnShuffled = []
solved = ['' for i in range(0, 8)]
guessed = [0 for i in range(0, 8)]
title = pairs[m]
for i in range(m+1, m+9):
    pair = pairs[i].split('-')
    column1.append(pair[0])
    column2.append(pair[1])
    columnShuffled.append(pair[1])
random.shuffle(columnShuffled)
columnPrint = columnShuffled

# welcome message shown at start


def printWelcome():
    cls()
    print('{:-^80s}'.format('****************'), end='\n\n\n\n')
    print('{:^80s}'.format('DOBRODOšLI U SLAGALICU!'), end='\n\n\n')
    print('{:>80s}'.format('min_console_size: 90 x 70'), end='\n')
    print('{:-^80s}'.format('****************'), end='\n\n')
    start = input('Da li zelite započeti igru KO ZNA ZNA?  da / ne >> ')
    return start

# welcome message and rules for asocijacije


def printWelcomeA():
    cls()
    print('{:-^80s}'.format('****************'), end='\n\n\n')
    print('{:^80s}'.format('ASOCIJACIJE'), end='\n\n\n')
    print('{:-^80s}'.format('****************'), end='\n\n')
    time.sleep(1)
    cls()
    print('{:-^80s}'.format('-'), end='\n\n')
    print('{:^80s}\n'.format('PRAVILA'))
    print('Asocijacije se igraju tako što se unosi ID polja u formatu SLOVOBROJ, npr. "A1",\n"b2","C3", "d4"... ')
    print('Ukoliko igrač želi da pogađa određenu kolonu to radi u obliku SLOVO odgovor, \nnpr. "C sunce"')
    print('Ukoliko igrač želi da pogađa konačno rešenje to radi tako što unosi slovo K \npa zatim odgovor, npr "K ftn". MAX BROJ POKUšAJA JE 4 i to je jedan od \
    \nnačina kako korisnik moze prekinuti igru ako ne zna odgovor.')
    print('Nije bitno da li je unos malim ili velikim slovima. Potrebno je paziti da se \nunose slova č,ć,đ,š!')
    print('Ukoliko igrač želi da odustane potrebno je da unese "exit" ')
    a = input('\n                    Pritisnite enter da nastavite!')

# quiz function:


def quiz():
    correct = -1
    rand_questions = [questions[i] for i in range(10)]
    for x in range(10):
        splitted = rand_questions[x].split('|')
        ans = 0
        for i in range(1, 5):
            if splitted[i].startswith('!'):
                ans = i
                splitted[i] = splitted[i][1:]
        drawQuiz(splitted, ans, x)
    cls()
    print('{:-^80s}'.format('-'), end='\n\n\n')
    line = 'U igri KO ZNA ZNA osvojili ste: ' + str(points) + ' bodova!'
    print('{:^80s}'.format(line), end='\n\n')
    print('{:-^80s}'.format('-'), end='\n\n')
    start = input('Da li želite početi igru ASOCIJACIJE?  da / ne  >> ')
    if start != 'da':
        exit()
    else:
        return

# function for getting user input and checking if it is correct


def getUserInput(game):
    global userIn, winA, kon
    if game == 'q':
        if correct == -1:
            userIn = input('Unesite slovo ispred odgovora: ')
            userIn.strip('\n')
            userIn.lower()
            if userIn == 'a' or userIn == 'b' or userIn == 'c' or userIn == 'd':
                return 1
            else:
                return 0
    elif game == 'a':
        userIn = input('Otvorite polje ili pokušajte pogoditi konačno: ')
        userIn.strip('\n')
        userIn = userIn.lower()
        if userIn == 'exit':
            winA = 1
            kon = '\x1b[5;30;41m' + 'EXIT!' + '\x1b[0m'
            cls()
            return 0
        if len(userIn) >= 2 and (userIn[0] == 'k' or ((ord(userIn[0]) > 96 and ord(userIn[0]) < 101) or (ord(userIn[1]) > 48 and ord(userIn[1]) < 53))):
            return 1
        else:
            return 0
    elif game == 's':
        userIn = input('Unesite slovo pored odgovora: ')
        userIn.strip('\n')
        userIn = userIn.lower()
        if len(userIn) == 1 and (ord(userIn) > 96 and ord(userIn) < 105):
            return 1
        else:
            return 0

# function for drawing and checking answers for quiz


def drawQuiz(question, ans, number):
    global points, userIn
    correct = -1
    while True:
        cls()
        print('{:-^80s}'.format('-'), end='\n\n')
        line = str(number+1)+'. ' + str(question[0])
        print('{:<80s}\n'.format(line))
        bullet = 'abcd'
        for i in range(1, 5):
            print('   ', end=' ')
            if correct != -1 and i == ans:
                print('{0:s}) '.format(
                    bullet[i-1]) + '\x1b[6;30;42m' + question[i] + '\x1b[0m')
            elif correct == 0 and bullet[i-1] == userIn:
                print('{0:s}) '.format(
                    bullet[i-1]) + '\x1b[5;30;41m' + question[i] + '\x1b[0m')
            else:
                print('{0:s}) {1:s} '.format(bullet[i-1], question[i]))
        print('\n', end=' ')
        print('{:->77s}'.format('BODOVI: '), end='')
        print(str(points), end='\n')
        userIn = ''
        if correct != -1:
            time.sleep(2)  # pauzaaaaaaaaaaaaaaaaaa
            break
        if getUserInput('q'):
            if userIn == bullet[ans-1]:
                points = points + 10
                correct = 1
            elif userIn != '' and userIn != bullet[ans-1]:
                correct = 0
                if points - 5 >= 0:
                    points = points - 5

# function for initializing asocijacije


def asocijacije():
    global points, userIn, winA, n
    columnA = columns[n].split('|')
    columnB = columns[n+1].split('|')
    columnC = columns[n+2].split('|')
    columnD = columns[n+3].split('|')
    result = columns[n+4]
    openedA = ['|____ '+'A'+str(i+1) + ' ____|' for i in range(4)]
    openedB = ['|____ '+'B'+str(i+1) + ' ____|' for i in range(4)]
    openedC = ['|____ '+'C'+str(i+1) + ' ____|' for i in range(4)]
    openedD = ['|____ '+'D'+str(i+1) + ' ____|' for i in range(4)]
    resRow = ['|>    ' + i + '     <|' for i in ['A', 'B', 'C', 'D']]
    konacno = '||_____  ?  _____||'

    printWelcomeA()
    while winA != 2:
        ascDraw(openedA, openedB, openedC, openedD, resRow,
                konacno, columnA, columnB, columnC, columnD, result)

    if attempts <= 3:
        print('{:-^80s}'.format('-'), end='\n')
        line = 'Vaš ukupan broj bodova je: ' + str(points)
        print('{:-^80s}'.format(line), end='\n')
    else:
        print('{:-^80s}'.format('-'), end='\n')
        line = 'Iskoristili ste sve pokušaje. Vaš broj bodova je: ' + \
            str(points)
        print('{:-^80s}'.format(line), end='\n')
    print('{:-^80s}'.format('-'), end='\n')
    a = input('Pritisnite enter da nastavite!')
    cls()
    print('{:-^80s}'.format('-'), end='\n\n')
    start = input('Da li želite početi igru SPOJNICE?  da / ne  >> ')
    if start != 'da':
        exit()
    else:
        return


def solve(x, X):
    for i in range(4):  # printing correct answers
        x[i] = '|{:^12s}|'.format(X[i])


def addPoints():
    global points, apoints
    points = points + 10
    if apoints >= 20:
        apoints = apoints - 15

# drawing asocijacije and checking if answers are correct


def ascDraw(a, b, c, d, r, k, A, B, C, D, R):
    global userIn, points, apoints, winA, kon, attempts

    while True:
        cls()
        print('{:-^80s}'.format('-'), end='\n\n')

        for i in range(4):
            print('    ', end='')
            print('  '+a[i]+'    '+b[i]+'    ' +
                  c[i]+'    '+d[i]+'    \n')
        print('\n', end='  ')
        if attempts > 3 and winA == 3:
            kon = '|\x1b[5;30;41m {:^20s} \x1b[0m|'.format(R)
            winA = 1
            r[0] = '|{:^12s}|'.format(A[4])
            r[1] = '|{:^12s}|'.format(B[4])
            r[2] = '|{:^12s}|'.format(C[4])
            r[3] = '|{:^12s}|'.format(D[4])
        for i in range(4):
            print('    '+r[i], end='')
        if kon != '':
            print('\n\n{:^80s}\n'.format(kon))
        else:
            print('\n\n{:^80s}\n'.format(k))
            line = 'BODOVI: ' + str(points) + '  '
            print('{:->80s}'.format(line), end='\n')

        if winA == 1:
            winA = 2
            break

        userIn = ''
        if getUserInput('a'):
            letter = userIn[0]
            if userIn[0] != 'k' and userIn[1].isdigit():
                num = int(userIn[1]) - 1
                if num < 4:
                    if letter == 'a' and a[num][0] == '|':
                        a[num] = '|{:^12s}|'.format(A[num])
                    elif letter == 'b' and a[num][0] == '|':
                        b[num] = '|{:^12s}|'.format(B[num])
                    elif letter == 'c' and a[num][0] == '|':
                        c[num] = '|{:^12s}|'.format(C[num])
                    elif letter == 'd' and a[num][0] == '|':
                        d[num] = '|{:^12s}|'.format(D[num])
                    apoints = apoints - 6
            elif userIn[1].isspace() and letter != 'k':
                col = userIn[0]
                user_ans = userIn[2:]
                # using dict to access index for certain letter
                if col == 'a' and r[cols[col]][0] == '|':
                    if user_ans == A[4]:
                        r[cols[col]] = '|{:^12s}|'.format(user_ans)
                        solve(a, A)
                        addPoints()
                elif col == 'b' and r[cols[col]][0] == '|':
                    if user_ans == B[4]:
                        r[cols[col]] = '|{:^12s}|'.format(user_ans)
                        solve(b, B)
                        addPoints()
                elif col == 'c' and r[cols[col]][0] == '|':
                    if user_ans == C[4]:
                        r[cols[col]] = '|{:^12s}|'.format(user_ans)
                        solve(c, C)
                        addPoints()
                elif col == 'd' and r[cols[col]][0] == '|':
                    if user_ans == D[4]:
                        r[cols[col]] = '|{:^12s}|'.format(user_ans)
                        solve(d, D)
                        addPoints()
            elif userIn[1].isspace():
                user_ans = userIn[2:]
                attempts = attempts + 1
                if attempts > 3:
                    winA = 3

                if user_ans == R:
                    winA = 1
                    points = points + apoints
                    kon = '|\x1b[6;30;42m {:^20s} \x1b[0m|'.format(user_ans)
                    r[0] = '|{:^12s}|'.format(A[4])
                    r[1] = '|{:^12s}|'.format(B[4])
                    r[2] = '|{:^12s}|'.format(C[4])
                    r[3] = '|{:^12s}|'.format(D[4])
                    solve(a, A)
                    solve(b, B)
                    solve(c, C)
                    solve(d, D)

            break


def printSolved():
    # printing solved spojnice
    cls()
    print('{:-^80s}'.format('-'), end='\n')
    print('{:^80s}'.format('Rešenje:'), end='\n\n')
    for i in range(0, 8):

        print('{0:>35s}{1:^10s}{2:<30s}'.format(
            solved[i], ' ----- ', column2[i]))

# drawing and managing spojnice


def spojnice():
    global title, column1, column2, columnShuffled, points, focus, userIn
    end = 0
    while True:
        cls()
        print('{:-^80s}'.format('-'), end='\n\n')
        print('{:^62s}'.format(title), end='\n\n')
        for i in range(0, 8):
            print('   ', end=' ')
            if focus == i:
                solved[i] = line1 = '\x1b[5;30;43m' + column1[i] + '\x1b[0m'
                line2 = columnPrint[i]
                line3 = bullets[i]  # zuta
                print('{0:>35s}{1:^10s}{2:<30s}{3:>9s}'.format(
                    line1, ' ----- ', line2, line3))
            elif guessed[i] == 1:
                solved[i] = line1 = '\x1b[4;30;44m' + column1[i] + '\x1b[0m'
                line2 = columnPrint[i]   # plava
                line3 = bullets[i]
                print('{0:>35s}{1:^10s}{2:<30s}{3:>9s}'.format(
                    line1, ' ----- ', line2, line3))
            elif guessed[i] == -1:
                solved[i] = line1 = '\x1b[4;30;41m' + column1[i] + '\x1b[0m'
                line2 = columnPrint[i]
                line3 = bullets[i]  # crvena
                print('{0:>35s}{1:^10s}{2:<30s}{3:>9s}'.format(
                    line1, ' ----- ', line2, line3))

            else:
                line1 = column1[i]
                line2 = columnPrint[i]
                line3 = bullets[i]
                print('{0:>21s}{1:^10s}{2:<30s}{3:>9s}'.format(
                    line1, ' ----- ', line2, line3))

        print('\n', end=' ')
        if end == 1:
            printSolved()
            print('{:-^80s}'.format('-'), end='\n\n')
            line = 'Vaš ukupan broj bodova iz sve 3 igre je: ' + str(points)
            print('{:-^80s}'.format(line), end='\n\n')
            print('{:-^80s}'.format('-'), end='\n\n')
            print('{0:50s}{1:>30s}'.format(
                'Čestitam! Nadam se da ste uživali', 'by SV25/2021 Cvijetic Danilo  '))
            a = input('Pritisnite enter da završtite!')
            break
        print('{:->77s}'.format('BODOVI: '), end='')
        print(str(points), end='\n')
        userIn = ''
        if getUserInput('s'):
            it = cols[userIn]
            if column2[focus] == columnShuffled[it] and userIn != '':
                points = points + 10
                guessed[focus] = 1
                columnPrint[it] = '\x1b[4;30;44m' + \
                    columnPrint[it] + '\x1b[0m'
            elif userIn != '':
                guessed[focus] = -1
            focus = focus + 1
        if focus == 8:
            end = 1
    return


# checking if game is starting
if printWelcome() != 'da':
    exit()
# calling three main games
quiz()
asocijacije()
spojnice()
