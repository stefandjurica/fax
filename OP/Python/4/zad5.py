file1 = open('users.txt', 'r+')
file2 = open('prices.txt', 'r+')
file3 = open('statistics.txt', 'w')
names = []
for line in file1.readlines():
    ime = line.split('|')
    names.append(str(ime[0]))
price = 0
avg = 0
i = 0
for line in file2.readlines():
    price = 0
    avg = 0
    prices = line.split('|')
    for pr in prices:
        price = price + int(pr)
    avg = price/len(prices)
    avg_formatted = '{0:.2f}'.format(avg)
    file3.write(names[i])
    file3.write('|')
    i = i+1
    file3.write(str(price))
    file3.write('|')
    file3.write(str(avg_formatted))
    file3.write('|')
    file3.write('\n')
file1.close()
file2.close()
file3.close()
