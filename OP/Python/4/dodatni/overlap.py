file1 = open('primes.txt', 'r')
file2 = open('happy.txt', 'r')
file3 = open('overlap.txt', 'w')
temp = []
for num in file1.readlines():
    temp.append(num)
print(temp)
for num in file2.readlines():
    for i in temp:
        if num == i:
            file3.write(num)
file1.close()
file2.close()
file3.close()
