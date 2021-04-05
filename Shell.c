#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
	printf("Welcome to New SpimOs\n");
	printf("Please choose an operation:\n");
	printf("0- Exit\n1- Bubble Sort\n2- Show Primes\n3- Factorize\n");
	
	int choice = -1;
	scanf("%d",&choice);
	
	char *mChar[5];
	mChar[0] = "spim";
	mChar[1] = "-file";
	mChar[2] = "shellHelp.asm";
	mChar[4] = NULL;
	switch(choice){
		case 0:
			choice = 0;
			break;
		
		case 1:
			mChar[3] = "BubbleSort.asmm";
			execvp("spim",mChar);
			break;
		
		case 2:
			mChar[3] = "ShowPrimes.asmm"; 
			execvp("spim",mChar);
			break;
		
		case 3:
			mChar[3] = "Factorize.asmm";
			execvp("spim",mChar);
			break;
	}
  return 0;
}