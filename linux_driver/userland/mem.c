#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

#define MAPPED_SIZE 0x10000//place the size here
#define DDR_RAM_PHYS  0x43c00000//place the physical address here

int main() {
int i;
int _fdmem;
int *map = NULL;
const char memDevice[] = "/dev/mem";

/* open /dev/mem and error checking */
_fdmem = open( memDevice, O_RDWR | O_SYNC );

if (_fdmem < 0){
	printf("Failed to open the /dev/mem !\n");
	return 0;
}
else{
	printf("open /dev/mem successfully !\n");
}

/* mmap() the opened /dev/mem */
map= (int *)(mmap(0,MAPPED_SIZE,PROT_READ|PROT_WRITE,MAP_SHARED,_fdmem,DDR_RAM_PHYS));

/* use 'map' pointer to access the mapped area! */
//for (i=0;i<3;i++) {
//printf("content: 0x%x\n",*(map+i));
//}

*(map+1) = 0xbabeface;
*(map+2) = 0xdeadbeef;
*(map+3) = 0x01234567;

printf("content @0x%x: 0x%x\n", 0x43c00004, *(map+1));
printf("content @0x%x: 0x%x\n", 0x43c00008, *(map+2));
printf("content @0x%x: 0x%x\n", 0x43c0000c, *(map+3));


/* unmap the area & error checking */
if (munmap(map,MAPPED_SIZE)==-1){
	perror("Error un-mmapping the file");
}

/* close the character device */
close(_fdmem);
return 0;
}

