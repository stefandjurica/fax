words = []
input_words = ['hello', 'world', 'hello', 'and', 'practice',
               'and', 'makes', 'perfect', 'and', 'hello', 'world', 'again']
for i in input_words:
    if not i in words:
        words.append(i)
for i in words:
    print(i, end=' ')
