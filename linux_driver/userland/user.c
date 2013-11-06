
#include <stdio.h>
#include <fcntl.h>
#include <assert.h>
#include <string.h> // for memset and strlen
#include <linux/ioctl.h>

int main(int argc ,char *argv[])
{
    int res = 0;
	assert(argc > 1);
	char *name = argv[1];//"/dev/soc_miner";
	char buf[100] ;
	char i = 0;
	memset(buf, 0, 100);

	int fp = open(name, O_RDONLY);
    if(fp < 0) {
        printf("Error opening %s ret: %d\n", name, fp);
        perror("open");
        return 1;
    }
    /*
    if((res = write(fp, argv[1], strlen(argv[1])) < 0)) {
        perror("write");

        goto clean;
    }
    if((res =read(fp, &buf[i++], 1) < 0)) {
        perror("read");
        goto clean;
    }

    clean:
    */
    if((res = ioctl(fp, _IOWR(233,0, char *), NULL)) < 0) {
       perror("ioctl\n");
       close(fp);
       return 2;
    
    }
        close(fp);

    return res;

}

