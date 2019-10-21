#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h> 
#include <sys/types.h> 
#include <sys/ipc.h> 
#include <sys/shm.h>

int main(int argc, char const *argv[])
{
	pid_t* mispids;
	int shmid = shmget(IPC_PRIVATE,sizeof(pid_t),IPC_CREAT|0666);
	mispids = (int *)shmat(shmid,0,0);


	for (int i = 0; i < 2; i++){
		*(mispids+i)=getpid();
		if(fork()!=0)
		{
			if(i==0){
				printf("Soy el proceso ejec: mi pid es %d \n", getpid());
			}
			break;
		} else {
			if(i==0){
				printf("Soy el proceso A: mi pid es %d. Mi padre es %d\n", getpid() , getppid());
			}
			if(i==1){
				printf("Soy el proceso B: mi pid es %d. Mi padre es %d. Mi abuelo es %d\n", getpid() , getppid(), (int)(*(mispids)));
				*(mispids+i+1)=getpid();
				for (int j = 0; j < 3; j++)
				{
					if(fork()==0){
						*(mispids+i+j+2)=getpid();
						if(j == 0){
							printf("Soy el proceso X: mi pid es %d. Mi padre es %d. Mi abuelo es %d. Mi bisabuelo es %d \n", getpid(), (int)(*(mispids+2)), (int)(*(mispids+1)), (int)(*(mispids)));	
						}
						if(j == 1){
							printf("Soy el proceso Y: mi pid es %d. Mi padre es %d. Mi abuelo es %d. Mi bisabuelo es %d \n", getpid(), (int)(*(mispids+2)), (int)(*(mispids+1)), (int)(*(mispids)));
						}
						if(j == 2){
							printf("Soy el proceso Z: mi pid es %d. Mi padre es %d. Mi abuelo es %d. Mi bisabuelo es %d \n", getpid(), (int)(*(mispids+2)), (int)(*(mispids+1)), (int)(*(mispids)));
						}
						break;
					}
				}
			}
		}
	}

	shmdt((pid_t *)mispids);      
	shmctl(shmid,IPC_RMID,0);
	sleep(10);
	exit(0);
}