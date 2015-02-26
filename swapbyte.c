#include <stdio.h>
#include "SwapByte_stub.h"

// extern void swapbyte(HsPtr a1, HsInt a2, HsInt a3); // haskell function

void print_buff ( unsigned char * buff, size_t len );

int main_with_haskell ( int argc, char ** argv )
{
  unsigned char buff[] = {'A','B','C','D','E','F','G','H','I','J'};
  
  print_buff(buff,sizeof(buff));
  swapbyte(buff, 2, 7);
  print_buff(buff,sizeof(buff));
  swapbyte(buff, 0, 2);
  print_buff(buff,sizeof(buff));
  swapbyte(buff, 7, 9);
  print_buff(buff,sizeof(buff));

  return 0;
}

int main ( int argc, char ** argv)
{
  int r;
  hs_init(&argc, &argv);
  r = main_with_haskell ( argc, argv );
  hs_exit();
  return r;
}


void print_buff ( unsigned char * buff, size_t len )
{
  size_t i;
  for( i = 0; i < len; ++i)
    {
      printf("%c,", buff[i]);
    }
  printf("\n");
}
