#include <stdio.h> 
#include <unistd.h> 
#include <stdlib.h> 
#include <fcntl.h> 
#include <sys/types.h> 
#include <sys/ipc.h> 
#include <sys/shm.h> 

int main(int argc, char const *argv[])
{
	pid_t* mispids; 
	// se crea la memoria compartida 
	int shmid = shmget(IPC_PRIVATE,sizeof(pid_t),IPC_CREAT|0666); 

	// se vincula la memoria 
	mispids = (int *)shmat(shmid,0,0); 

	pid_t padre = getpid(); 

	// el proceso principal guarda su pid en memoria 
	*(mispids)=getpid();
	printf("Soy el proceso principal, mi pid es %d, y he guardado en memoria %d\n",getpid(),(int)(*(mispids))); 

	// generamos los hijos en horizontal que escriben en memoria 
	for (int j = 0; j < 2; ++j)
	{
		pid_t pidy = fork();
		if(pidy==0){
			mispids = (int *)shmat(shmid,0,0); // se vincula la memoria en los procesos hijo 
			*(mispids+j+1) = getpid();         // se escribe en memoria
			printf("Soy el hijo con pid %d, la j es %d y he guardado en memoria %d\n",getpid(),j,(int)(*(mispids+j+1))); 
			break;
		}
	}
	sleep(15);

	// proceso de lectura de memoria desde el proceso principal
	if (getpid() == padre)    
	{      
		sleep(2); 
		printf("Soy el proceso principal con pid(%d) y mis hijos son: ",(int) (*(mispids))); 
		// bucle de impresión de los valores      
		// almacenados por los hijos 
		int cont;

		for(cont=1; cont<=2; cont++){
			printf("pid(%d) ",(int)(*(mispids+cont))); 
		}
		printf("\n");

		// se desvincula la memoria y se borra 
		shmdt((pid_t *)mispids);      
		shmctl(shmid,IPC_RMID,0); 
	}
	else
	{
		// se desvincula la memoria desde los procesos hijo     
		shmdt((pid_t *)mispids);
	}
	return 0;
}