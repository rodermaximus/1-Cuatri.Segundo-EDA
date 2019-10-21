#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h> 
#include <sys/types.h> 
#include <sys/ipc.h> 
#include <sys/shm.h>

int main(int argc, char const *argv[])
{
	int abu;
	pid_t* mispids;
	int shmid = shmget(IPC_PRIVATE,sizeof(pid_t),IPC_CREAT|0666);
	mispids = (int *)shmat(shmid,0,0);

	pid_t padre=getpid();
	*(mispids)=getpid();

	printf("Soy el proceso ejec: mi pid es %d \n", getpid());
	for(int i=0; i<3 ; i++){
		pid_t pid=fork();
		if(pid){
			if(i==0){
				//printf("Soy el proceso A: mi pid es %d. Mi padre es %d \n",pid ,getpid());
				mispids=(int*)shmat(shmid,0,0);
				*(mispids+i+1);
				printf("Soy el hijo con pid %d, la i es %d y he guardado en memoria %d\n",pid ,i,(int)(*(mispids+i+1)));
			}
			if(i==1){
				printf("Soy el proceso B: mi pid es %d. Mi padre es %d. Mi abuelo es \n",pid,getpid()); //Vertical final
				abu=getpid();
			}
			mispids=(int*)shmat(shmid,0,0);
			*(mispids+i+1);
			printf("Soy el hijo con pid %d, la i es %d y he guardado en memoria %d\n",getpid(),i,(int)(*(mispids+i+1))); 
			break;
				for(int j=0; j<2 ; j++){
					if(fork()==0){
						if(j==0){
						}
						if(j==1){
						}
						if(j==2){
						}
						break;
					}
				}
			}
			break;
		}
	sleep(10);
	exit(0);
}