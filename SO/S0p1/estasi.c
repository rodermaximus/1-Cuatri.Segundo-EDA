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
	
	void despierta()
	{
	}  
	
	void ls(){     
		if(fork() == 0)      
			execlp("ls", "ls", NULL);   
		else     
			wait(NULL); 
	}  
	
	void pstree(){     
		if(fork() == 0)     
			execlp("pstree", "pstree", "-p", NULL);   
		else     
			wait(NULL); 
	} 




	int main(int argc, char * argv[]){ 
		int i,j,k,pid;
		int tiemz;   
		char proc;      
		if(argc == 3){
		pid_t* mispids;
		int shmid = shmget(IPC_PRIVATE,sizeof(pid_t),IPC_CREAT|0666);
		mispids = (int *)shmat(shmid,0,0);     
      	tiemz = atoi(argv[2]);    
      	proc = argv[1][0]; 
      	*(mispids)=getpid();        
      	printf("Soy el proceso ejec: mi pid es %d\n", *(mispids));
      	for(i = 1; i <= 2; i++){       
      		pid = fork();       
      			if(pid != 0){
      				break;         
      			}else{
      				if(i == 1){
      					*(mispids+i)=getpid();
      		            printf("Soy el proceso A: mi pid es %d. Mi padre %d\n", *(mispids+1) , *(mispids));              
      		        }         
      		        if(i == 2){
      		            *(mispids+i)=getpid();
					    printf("Soy el proceso B: mi pid es %d %d. Mi padre %d. Mi abuelo %d\n",getpid(), *(mispids+2), *(mispids+1), *(mispids));  
					 }
				}     
		}     
		if(i == 1){
			wait(NULL);//Espera ejec
			printf("Soy ejec(%d) y muero\n", *(mispids)); 
		}     
		if(i == 2){
		          signal(10, pstree); 
		          signal(12, despierta);
		          wait(NULL); //Espera A.       
		          printf("Soy A(%d) y muero\n", *(mispids+1));    
		          }     
		if(i == 3){        
		          for(j = 1; j <= 3; j++){         
		          pid = fork();                
		            if(pid == 0){           
		            switch(j){             
		            case 1:                             
			            printf("Soy el proceso X: mi pid es %d. Mi padre %d. Mi abuelo %d. Mi bisabuelo %d\n", getpid(),*(mispids+2) , *(mispids+1), *(mispids));               
			            *(mispids+2+1)=getpid();
			            signal(SIGUSR1, ls);               
			            signal(SIGUSR2, despierta);                             
			            pause();                        
		            break;             
		            case 2:                              
			            printf("Soy el proceso Y: mi pid es %d. Mi padre %d. Mi abuelo %d. Mi bisabuelo %d\n", getpid(),*(mispids+2), *(mispids+1), *(mispids));               
			            *(mispids+2+2)=getpid();
			            signal(SIGUSR1, ls);               
			            signal(SIGUSR2, despierta);
			            pause();                         
		            break;
		           	case 3:               
			           	printf("Soy el proceso Z: mi pid es %d. Mi padre %d. Mi abuelo %d. Mi bisabuelo %d\n", getpid(),*(mispids+2), *(mispids+1), *(mispids));              
			           	*(mispids+2+3)=getpid();
			           	signal(SIGALRM, alarma);               
			           	alarm(tiemz);               
			           	pause();                              
				           	switch(proc){                 
				           	case 'X':                                
				           	printf("Soy X y he recibido la señal\n");     
					           	kill(*(mispids+2+1), SIGUSR1);                   
					           	signal(SIGALRM, alarma);                   
					           	alarm(tiemz);                   
					           	pause();                                                       
					           	kill(*(mispids+2+2), SIGUSR2);                 
				           	break;                 
				           	case 'Y':  
				           	printf("Soy Y y he recibido la señal\n");                 
					           	kill(*(mispids+2+2), SIGUSR1);                   
					           	signal(SIGALRM, alarma);                   
					           	alarm(tiemz);                   
					           	pause();                                    
					           	kill(*(mispids+2+1), SIGUSR2);                   
				           	break;                 
				           	case 'A':
				           	printf("Soy A y he recibido la señal\n");                   
					           	kill(*(mispids+1), SIGUSR1);                   
					           	signal(SIGALRM, alarma);                   
					           	alarm(tiemz);                   
					           	pause();                                     
					           	kill(*(mispids+2+2), SIGUSR2);
					      		kill(*(mispids+2+1), SIGUSR2);                         
				      		break;                 
				      		case 'B':  
				      		printf("Soy B y he recibido la señal\n");                 
					      		kill(*(mispids+2), SIGUSR1);                   
					      		signal(SIGALRM, alarma);                   
					           	alarm(tiemz);                   
					      		pause();                                     
					      		kill(*(mispids+2+1), SIGUSR2);                   
					      		kill(*(mispids+2+2), SIGUSR2);                         
				      		break;               
				      		}             
			      	break;           
			      	}           
			      		if(j==1)
			      		{
							printf("Soy X(%d) y muero\n", *(mispids+3));
			      		}else if(j==2)
			      		{
			      			printf("Soy Y(%d) y muero\n", *(mispids+4));
			      		}else if(j==3)
			      		{
			      			printf("Soy Z(%d) y muero\n", getpid());
				      		//exit(0);
			      		}        
			      		/*switch(j){             
				      		case 1:               
				      							               
				      		break;             
				      		case 2:               
				      			printf("Soy Y(%d) y muero\n", *(mispids+4));               
				      		break;             
				      		case 3:               
				      			printf("Soy Z(%d) y muero\n", getpid());
				      			exit(0);               
				      		break;           
			      		}   */        
		      		break;         
		      		}       
		      		}       
		      		if(j == 4){         
		      			signal(SIGUSR1, pstree);         
		      			signal(SIGUSR2, despierta);                
		      			for(k = 1; k <= 3; k++){//Espera B.       
		      				wait(NULL);         
		      			}         
		      			printf("Soy B(%d) y muero\n", *(mispids+2));       
		      			}     
		      		}   
		      	if(getpid() == (int)(*(mispids)))
		      	{
			        shmdt((pid_t *)mispids);
			        shmctl(shmid,IPC_RMID,0);
    			}
   				else{
        			shmdt((pid_t *)mispids);
    			}
		      	}     
		      	return 0;
		      }
