#include <stdio.h>
#include <stdint.h> // uint8_t
#include <unistd.h>
#include "socal/socal.h"
// The Altera SoC Abstraction Layer (SoCAL) API Reference Manual
#include <sys/mman.h> // mmap
#include <fcntl.h> // open

#define LEDADD (0xff200000)

int main() {
      
  size_t largobytes = 1;
  void * virtualbase; // puntero generico con map de userspace a hw
  int fd; // file descriptor

  fd = open("/dev/mem", (O_RDWR|O_SYNC));

  virtualbase = mmap(NULL, largobytes,
   (PROT_READ|PROT_WRITE), MAP_SHARED, fd, LEDADD);
  // MAP_SHARED comparte la memoria con otras apicaciones
  // PROT READ y PROT WRITE, para lectura y escritura

  uint8_t valor = 1;
  while(1) {
    valor = ~valor;
    alt_write_byte(virtualbase, valor); // escribimos este valor al puntero
    sleep(1);
  }

	return( 0 );
}
