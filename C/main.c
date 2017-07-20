#include <stdio.h> // printf
#include <stdint.h> // uint8_t
#include <stdlib.h> // size_t
#include <unistd.h>
#include <stdbool.h> // bool type
#include <sys/mman.h> // mmap
#include <fcntl.h> // open
#include <pthread.h> // pthreads
// The Altera SoC Abstraction Layer (SoCAL) API Reference Manual
#include "socal/socal.h"
#include "socal/hps.h" // para BASEADD

#define LEDADD 	  (0x0000)
#define SWITCHADD (0x0010)
#define BASEADD	  ALT_LWFPGASLVS_OFST

void * leerSwitch(void * ptr);
void function_1();
void function_2();

void * virtualbase; // puntero generico con map de userspace a hw

int main()
{
  size_t largobytes = 1;

  int fd; // file descriptor
  fd = open("/dev/mem", (O_RDWR|O_SYNC));

  virtualbase = mmap(NULL, largobytes,
   (PROT_READ|PROT_WRITE), MAP_SHARED, fd, BASEADD);
  // MAP_SHARED comparte la memoria con otras apicaciones
  // PROT READ y PROT WRITE, para lectura y escritura

  pthread_t thread;
  pthread_create(&thread, NULL, leerSwitch, NULL);

  while(1) {
    sleep(1); // sleep forever
  }

  return 0;
}

void * leerSwitch(void * ptr)
{
  uint8_t SW = 0;
  uint8_t SW_OLD;

  while(1){
    SW_OLD = SW;
    SW = alt_read_byte(virtualbase + (uint32_t)SWITCHADD);

    if(SW == 1 && SW != SW_OLD) {
      //switchOn = true;
      printf("%s\n", "encendido");
      function_1();
    }
    else if (SW == 0  && SW != SW_OLD) {
      //switchOn = false;
      printf("%s\n", "apagado");
      function_2();
    }
    else {};
  }
}

void function_1() {
  printf("%s\n", "se ejecuta una funcion");
  alt_write_byte(virtualbase + (uint32_t)LEDADD, 1);
}

void function_2() {
  printf("%s\n", "se ejecuta otra funcion");
  alt_write_byte(virtualbase + (uint32_t)LEDADD, 0);
}
