#include <stdio.h>
#include "SwapByte_stub.h"

void show_buff ( unsigned char * buff, size_t len );

int main_with_haskell ( int argc, char ** argv )
{
  unsigned char buff[] = {0,1,2,3,4,5,6,7,8,9};
  
  show_buff(buff,sizeof(buff));
  swap(buff);
  show_buff(buff,sizeof(buff));

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


void show_buff ( unsigned char * buff, size_t len )
{
  size_t i;
  for( i = 0; i < len; ++i)
    {
      printf("%d,", buff[i]);
    }
  printf("\n");
}
