#include <stdio.h>
unsigned put_byte(unsigned x, unsigned char b, int i){
  int shift_val = i<<3;
  int pre_x = x&(~(0xFF<<shift_val));
  int pre_b = (0x0|b)<<shift_val;
  return pre_b|pre_x;
}

int main(){
  printf("%.8x\n",put_byte(0x12345678,0xAB,2));
  printf("%.8x\n",put_byte(0x12345678,0xAB,0));
}
