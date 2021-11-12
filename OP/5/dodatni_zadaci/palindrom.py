def isPalindrome(string):
    palindrome = 1
    n = int(len(string)/2)
    length = len(string)
    for i in range(n):
        if string[i] != string[length - 1 - i]:
            palindrome = 0
    return palindrome


if isPalindrome("anavolimilovana"):
    print("Palindrom je!")
else:
    print("Nije palindrom!")
