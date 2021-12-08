#include <stdio.h>

unsigned int RUNPP_REG_ERR = 0;

void shiftujDvostruko(unsigned long long *a, unsigned int *b, unsigned n);

int main() {

  unsigned int n;
  printf("Unesite N: ");
  scanf("%u", &n);
  unsigned long long A[n];
  unsigned int B[n];
  printf("Unesite elemente niza A: \n");
  for (int i = 0; i < n; i++) {
    scanf("%lld", &A[i]);
  }
  printf("Unesite elemente niza B: ");
  for (int i = 0; i < n; i++) {
    scanf("%ud", &B[i]);
  }
  shiftujDvostruko(A, B, n);
  printf("Elementi niza su: \n");
  for (int i = 0; i < n; i++) {
    printf("%lld, ", A[i]);
  }

#ifdef LEVEL42
  printf("\nRUNPP_REG_ERR:%d\n", RUNPP_REG_ERR);
#endif
  return (0);
}
