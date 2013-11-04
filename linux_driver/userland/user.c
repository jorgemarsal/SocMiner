
#include <stdio.h>
#include <fcntl.h>
#include <assert.h>
#include <string.h> // for memset and strlen

int main(int argc ,char *argv[])
{

    int res = 0;
	assert(argc > 1);
	char buf[100] ;
	char i = 0;
	memset(buf, 0, 100);

	int fp = open("/dev/soc_miner", O_RDWR);
    if(fp < 0) {
        printf("Error opening soc_miner ret: %d\n", fp);
        perror("open");
        return 1;
    }
    if((res = write(fp, argv[1], strlen(argv[1])) < 0)) {
        perror("write");

        goto clean;
    }
    if((res =read(fp, &buf[i++], 1) < 0)) {
        perror("read");
        goto clean;
    }

    clean:
        close(fp);

    return res;

}

