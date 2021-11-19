

def obracun(file_name, price):
    ifile = open(file_name, 'r')
    for line in ifile.readlines():
        line = line[:-1]
        hours = 0
        zarada = 0
        data = line.split('|')

        for i in range(1, len(data)):
            hours = hours + int(data[i])
        if hours > 40:
            price = price * 1.5
        zarada = hours * price
        print('Ime: ', data[0])
        print('Zarada: {:.2f}'.format(zarada))


obracun("radnici.txt", 1000)
