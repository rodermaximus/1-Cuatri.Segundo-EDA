#include <stdio.h>
#include <stdlib.h>
#include <signal.h>

void alarma()
{
	printf("acabo de recibir un SIGALARM\n");
}

main()
{
	signal(SIGALRM,alarma);
	printf("Acabo de progamar la captura de un SIGALARM\n");
	alarm(5);
	printf("Ahora he programado la alarma en 3 seg\n");
	pause();
	printf("Ahora continuo cpn la ejecución normal\n");
}