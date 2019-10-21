#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h> 
#include <signal.h>
#include <sys/types.h> 
#include <sys/ipc.h> 
#include <sys/shm.h>
void alarma()
{

}
void despertar()
{
}
void ejecutals(){   
	if(fork() == 0)      
		execlp("ls", "ls", NULL);   
	else     
		wait(NULL); 
} 

void ejecutapstree(){   
	if(fork() == 0)     
		execlp("pstree", "pstree", "-p", NULL);   
	else     
		wait(NULL); 
}

int main(int argc, char const *argv[])
{
	pid_t* mispids;
	int shmid = shmget(IPC_PRIVATE,sizeof(pid_t),IPC_CREAT|0666);
	mispids = (int *)shmat(shmid,0,0);
	int tiemz = atoi(argv[2]);
	char proc = *argv[1];
	int i,j,k;


	for (i = 0; i < 2; i++){
		*(mispids+i)=getpid();
		if(fork()!=0)
		{
			if(i==0){
				printf("Soy el proceso ejec: mi pid es %d \n", getpid());
			}
			if(i==1){
				signal(10, ejecutapstree);               
		        signal(12, despertar);
		        pause();
			}
			break;
		} else {
			if(i==0){
				printf("Soy el proceso A: mi pid es %d. Mi padre es %d\n", getpid() , getppid());
			}
			if(i==1){
				printf("Soy el proceso B: mi pid es %d. Mi padre es %d. Mi abuelo es %d\n", getpid() , getppid(), (int)(*(mispids)));
				signal(10, ejecutapstree); 
		        signal(12, despertar);
				*(mispids+i+1)=getpid();
				for (j = 0; j < 3; j++)
				{
					if(fork()==0){
						*(mispids+i+j+2)=getpid();
						if(j == 0){
							printf("Soy el proceso X: mi pid es %d. Mi padre es %d. Mi abuelo es %d. Mi bisabuelo es %d \n", getpid(), (int)(*(mispids+2)), (int)(*(mispids+1)), (int)(*(mispids)));	
							signal(10, ejecutals);               
		            		signal(12, despertar);
		            		pause(); 
						}
						if(j == 1){
							printf("Soy el proceso Y: mi pid es %d. Mi padre es %d. Mi abuelo es %d. Mi bisabuelo es %d \n", getpid(), (int)(*(mispids+2)), (int)(*(mispids+1)), (int)(*(mispids)));
							signal(10, ejecutals);               
		           			signal(12, despertar);
		           			pause();
						}
						if(j == 2){
							printf("Soy el proceso Z: mi pid es %d. Mi padre es %d. Mi abuelo es %d. Mi bisabuelo es %d \n", getpid(), (int)(*(mispids+2)), (int)(*(mispids+1)), (int)(*(mispids)));
							signal(14,alarma);
							alarm(tiemz);
							pause();
							switch(proc)
							{                 
						        case 'X':                                   
						           	kill(*(mispids+3), 10);                   
						           	signal(14, despertar);                   
						           	alarm(tiemz);                   
						      		pause();                                                 
						           	kill(*(mispids+4), 12);                 
						           	break;                 
						        case 'Y':                   
						           	kill(*(mispids+4), 10);                   
						           	signal(14, despertar);                   
						           	alarm(tiemz);                   
						      		pause();                                    
						           	kill(*(mispids+3), 12);                   
						           	break;                 
						        case 'A':                   
						           	kill(*(mispids+1), 10);                   
						           	signal(14, despertar);                   
						           	alarm(tiemz);                   
						      		pause();                                
						           	kill(*(mispids+4), 12);
						      		kill(*(mispids+3), 12);                         
						      		break;                 
						      	case 'B':                   
						      		kill(*(mispids+2), 10);                   
						      		signal(14, despertar);                   
						      		alarm(tiemz);                   
						      		pause();                                  
						      		kill(*(mispids+3), 12);                   
						      		kill(*(mispids+4), 12);                         
						      		break;               
				      		}
				      		printf("Soy Z(%d) y muero\n", *(mispids+5));
				      		exit(0);

						}
						break;
					}
					if(j==2)
					{
						pause();
					}
				}
			}
		}
	}

	if(*mispids==getpid())
	{
		wait();
		printf("Soy ejec(%d) y muero\n", *(mispids));
	}else if(*(mispids+1)==getpid())
	{
		wait();
		printf("Soy A(%d) y muero\n", *(mispids+1)); 
	}else if(*(mispids+2)==getpid())
	{
		wait();
		wait();
		wait();
		printf("Soy B(%d) y muero\n", *(mispids+2)); 
	}
	if(getpid() == (int)(*(mispids))){
        shmdt((pid_t *)mispids);
        shmctl(shmid,IPC_RMID,0);
    }
    else{
        shmdt((pid_t *)mispids);
    }
	//sleep(10);
	return 0;
}