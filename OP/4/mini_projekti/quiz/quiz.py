import random
import os


def cls():
    os.system('cls' if os.name == 'nt' else 'clear')


pitanja = open('quiz.txt', 'r', encoding='utf-8')
questions = []
for i in pitanja.readlines():
    questions.append(i)
random.shuffle(questions)
cls()
points = 0
for i in range(len(questions)):

    answer = 0
    user_answer = 0
    splitted = questions[i].split('|')
    print('{:<100s}'.format(splitted[0]))
    for j in range(1, len(splitted)):
        if splitted[j][0] == '!':
            splitted[j] = splitted[j][1:]
            answer = j
        print('{:d}. {:<40s}'.format(j, splitted[j]))
    user_answer = int(input('Unesite odgovor: '))
    if user_answer == answer:
        points = points + 1
    izlaz = input(
        'Da li zelite da nastavite (n) ili da izadjete (i)? >> n/i >> ')
    if izlaz == 'i':
        cls()
        print('Broj osvojenih bodova je: ', points)
        exit()
    cls()
cls()
print('Broj osvojenih bodova je: ', points)
