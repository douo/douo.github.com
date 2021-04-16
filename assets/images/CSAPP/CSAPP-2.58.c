#include <stdio.h>
typedef unsigned char *byte_pointer;
const char ONE = 0x01;
int is_little_endian(){
  int t = 0x1; // 0x00000001,
  //little endian: 01 00 00 00
  //big endian 00 00 00 01
  byte_pointer start =(byte_pointer) &t;
  if(start[0] == ONE){ //
    return 1;
  }else{
    return 0;
  }
}

int main(int argc, const char* argv[]){
  printf(is_little_endian()?"is little endian":"is big endian");
  printf("\n");
}
