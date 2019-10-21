#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h> 
	void despiertaNormal(){

	}  
	void ejecutals(){   
		printf("ejecutando ls\n");   
		if(fork() == 0)      
			execlp("ls", "ls", NULL);   
		else     
			wait(NULL); 
	}  
	
	void ejecutapstree(){   
		printf("ejecutando pstree\n");   
		if(fork() == 0)     
			execlp("pstree", "pstree", "-p", NULL);   
		else     
			wait(NULL); 
	} 




	int main(int argc, char * argv[]){ 
		int pid, pidarb, pida, pidb, pidx, pidy, pidz, i;
		int tiempo;   
		char procesoSeleccionado;      
		if(argc == 3){     
      	tiempo = atoi(argv[2]); // pasamos a entero la cadena.     
      	procesoSeleccionado = argv[1][0]; // primera caracter del segundo argumento     
      	pidarb = getpid();     
      	printf("Soy el proceso arb: mi pid es %d\n", pidarb);     
      	for(i = 1; i <= 2; i++){       
      		pid = fork();       
      			if(pid != 0){ // el padre se sale del bucle.
      				break;         
      			}else{
      				if(i == 1){
      					pida = getpid();
      		            printf("Soy el proceso A: mi pid es %d. Mi padre %d\n", pida, pidarb);// vuelve a hacer el bucle con i = 2.              
      		        }         
      		        if(i == 2){
      		                   pidb = getpid();
					           printf("Soy el proceso B: mi pid es %d. Mi padre %d. Mi abuelo %d\n", pidb, pida, pidarb);  
					 }
				}     
		}     
		if(i == 1){
			wait(NULL);
			       printf("Soy arb y muero\n"); // la ultima sentencia arb, tiene que esperar a A.
		}     
		if(i == 2){
		       // A sale del bucle con 2
		          signal(SIGUSR1, ejecutapstree); 
		          signal(SIGUSR2, despiertaNormal);
		          wait(NULL); // aqui espera A.       
		          printf("Soy A y muero\n");     
		          }     
		if(i == 3){       // EL PROCESO B.       
		          for(i = 1; i <= 3; i++){         
		          pid = fork();         
		          if(pid != 0){           
		          switch(i){            
		           case 1: pidx = pid; break;            
		            case 2: pidy = pid; break;             
		            case 3: pidz = pid; break;           
		            }                 
		            }         
		            if(pid == 0){           
		            switch(i){             
		            case 1:               
		            //pidX = getpid();               
		            printf("Soy el proceso X: mi pid es %d. Mi padre %d. Mi abuelo %d. Mi bisabuelo %d\n", getpid(), pidb, pida, pidarb);               
		            signal(SIGUSR1, ejecutals);               
		            signal(SIGUSR2, despiertaNormal);                             
		            pause();                        
		            break;             
		            case 2:               
		            //pidY = getpid();               
		            printf("Soy el proceso Y: mi pid es %d. Mi padre %d. Mi abuelo %d. Mi bisabuelo %d\n", getpid(), pidb, pida, pidarb);               
		            signal(SIGUSR1, ejecutals);               
		            signal(SIGUSR2, despiertaNormal);               
		            pause();                        
		            break;
		           	case 3:               
		           	printf("Soy el proceso Z: mi pid es %d. Mi padre %d. Mi abuelo %d. Mi bisabuelo %d\n", getpid(), pidb, pida, pidarb);               // Z tiene que dormir el tiempo que se le indique en               
		           	// el parametro.               
		           	//sleep(tiempo);              
		           	signal(SIGALRM, despiertaNormal);               
		           	alarm(tiempo);               
		           	pause();               
		           	// Z debe mandar las seÃ±ales al resto de procesos.               
		           	switch(procesoSeleccionado){                 
		           	case 'X':                   
		           	// EJECUTA COMANDO                   
		           	kill(pidx, SIGUSR1);                   
		           	signal(SIGALRM, despiertaNormal);                   
		           	alarm(tiempo);                   
		           	pause();                                    
		           	// DESPIERTA NORMAL                   
		           	kill(pidy, SIGUSR2);                 
		           	break;                 
		           	case 'Y':                   
		           	kill(pidy, SIGUSR1);                   
		           	signal(SIGALRM, despiertaNormal);                   
		           	alarm(tiempo);                   
		           	pause();                                    
		           	kill(pidx, SIGUSR2);                   
		           	break;                 
		           	case 'A':                   
		           	kill(pida, SIGUSR1);                   
		           	signal(SIGALRM, despiertaNormal);                   
		           	alarm(tiempo);                   
		           	pause();                                     
		           	kill(pidy, SIGUSR2);
		      		kill(pidx, SIGUSR2);                         
		      		break;                 
		      		case 'B':                   
		      		kill(pidb, SIGUSR1);                   
		      		signal(SIGALRM, despiertaNormal);                   
		      		alarm(tiempo);                   
		      		pause();                                     
		      		kill(pidx, SIGUSR2);                   
		      		kill(pidy, SIGUSR2);                         
		      		break;               
		      		}             
		      		break;           
		      		}                      
		      		switch(i){             
		      		case 1:               
		      		printf("Soy X y muero\n");               
		      		break;             
		      		case 2:               
		      		printf("Soy Y y muero\n");               
		      		break;             
		      		case 3:               
		      		printf("Soy Z y muero\n");               
		      		break;           
		      		}           
		      		break; // los hijos de B se salen del bucle.         
		      		}       
		      		}//Cierre for       
		      		if(i == 4){ // PADRE. cuando acaba el bucle tiene que esperar a sus tres hijos, para no morirse antes que ellos.         
		      			signal(SIGUSR1, ejecutapstree);         
		      			signal(SIGUSR2, despiertaNormal);                
		      			for(i = 1; i <= 3; i++){           
		      				wait(NULL);         
		      			}         
		      			printf("Soy B y muero\n");       
		      			}     
		      		}   
		      	}   
		      	else{     
		      		printf("Error. Uso: %s <proceso> <tiempo>\n", argv[0]);   
		      	}   
		      	return 0;
		      }




