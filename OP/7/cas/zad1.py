# 3.74+0.6215T-35.75(V0.16)+0.4275T(V0.16)
from math import pow


def subjective(t, v):
    result = 3.74 + 0.6215 * t - 35.75 * \
        pow(v, 0.17) + 0.4275 * t * pow(v, 0.17)
    return result


def napraviTabelu(vstart, vend, tstart, tend):
    print('T       ', end=' ')
    print('\n')
    for i in range(tstart, tend+1):
        print('t={:<8s}'.format(str(i)), end=' ')
    print('\n')
    for i in range(vstart, vend+1):
        print('v={:d}'.format(i), end='       ')
        for j in range(tstart, tend):
            print('t={:<8.3f}'.format(subjective(j, i)), end=' ')
        print('\n')


napraviTabelu(0, 10, 5, 10)
