#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>


int main(int argc, char const *argv[])
{
 	for (int i = 0; i < 3; i++){
		if(fork()!=0)
		{
			if(i==2){
				for (int i = 0; i < 2; i++)
				{
					if(fork()==0){
						break;
					}
				}
			}
			break;
		}
	}
	sleep(10);
	exit(0);
}