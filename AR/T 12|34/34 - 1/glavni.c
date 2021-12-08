#include <stdio.h>
#include <string.h>

unsigned int RUNPP_REG_ERR = 0;

void potprogram(unsigned char *s1, unsigned char *s2, char *r);

int main() {
  unsigned char string1[20];
  unsigned char string2[20];
  char R;
  unsigned int g;
  printf("Unesite S1: ");
  scanf("%20[^\n]s", string1);

  printf("Unesite S2: ");
  scanf("%20[^\n]s", string2);

  potprogram(string1, string2, &R);

#ifdef LEVEL42
  printf("\nRUNPP_REG_ERR:%d\n", RUNPP_REG_ERR);
#endif
  return (R);
}
