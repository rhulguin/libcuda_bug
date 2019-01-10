#include <cuda.h>
#include <stdio.h>
#include <unistd.h>

int main(){
	printf("Press Ctrl+z to suspend program\n");
	printf("Type bg to send program to background\n");
	printf("Attach to process with cuda-gdb\n\n");
	printf("cuda-gdb --pid=%d\n\n", getpid());
	printf("Issue the following commands in (cuda-gdb)\n");
	printf("   set var dummy=1\n");
	printf("   continue\n");
	fflush(stdout);
	volatile int dummy=0;
	int dummy2=0;
	while(!dummy){
		dummy2=1;
	}
	dummy=dummy2;

	// Initialize
	cuInit(0);

	// Get number of devices supporting CUDA
	int deviceCount = 0;
	cuDeviceGetCount(&deviceCount);
	if (deviceCount == 0) {
		printf("There is no device supporting CUDA.\n");
		exit (0);
	}
	printf("There are %d CUDA devices\n", deviceCount);
	return 0;
}
