/*-----------------------------------------------------------------
Codificar en ensamblador del ARM un programa que dado un vector A de N
enteros mayores de 0, obtenga un vector B con los valores de A ordenados de
mayor a menor.    Para ello usar la funci�n definida en el apartado anterior y
seguir  un algoritmo de ordenaci�n basado en el siguiente c�digo de alto nivel:

#define N 8

int A[N]={7,3,25,4,75,2,1,1};
int B[N];

void main(){
	Int posmax;
	for(j=0; j<N; j++){
		posmax= PosMax(A,N)
		B[j]=A[posmax];
		A[posmax]=0;
	}
}

/*-----------------------------------------------------------------