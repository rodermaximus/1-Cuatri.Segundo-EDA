#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h> 
#include <sys/types.h> 
#include <sys/ipc.h> 
#include <sys/shm.h>

void main(int argc, char const *argv[])
{
	for(int i = 0; i < 3 ; i++)
	{
		if(fork()==0)
		{
			if(i==0)
			{
				fork();
				break;
			}
			if(i==1)
			{
				for(int j=0; j<2 ; j++)
				{
					if(fork()==0)
					{
						break;
					}
				}
				break;
			}
			if(i==2)
			{
				if(fork()==0)
				{
					fork();
					break;
				}
				break;
			}
		}
	}
	sleep(10);

}