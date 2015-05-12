/*-----------------------------------------------------------------
**
**  Fichero:
**    rutinas_asm.asm  10/6/2014
**
**    Fundamentos de Computadores
**    Dpto. de Arquitectura de Computadores y Autom�tica
**    Facultad de Inform�tica. Universidad Complutense de Madrid
**
**
**
**  Notas de dise�o:
**
**---------------------------------------------------------------*/

.global contarUnos


.text
/*	PROCEDIMIENTO QUE RECIBE 4 PARAMETROS
R0	DIRECCION DEL PRIMER ELEMENTO DE LA MATRIZ
R1	DIRECCION DEL VECTOR (n� de filas de la matriz = longitud del vector | elementos obntenidos en posiciones del vector = n� de filas )
R2	VALOR DEL NUMERO DE FILAS DE LA MATRIZ
R3	VALOR DEL NUMERO DE COLUMNAS DE LA MATRIZ
*/

contarUnos:
  		PUSH {R4,R5,R6,R7,R8}	//prologo, subrutina hoja, 2 variabes locales "i" "j", no retorna resultado
 		MOV R4, #0				//inicializar "i"
 		MOV R5, #0				//auxiliar de intercambio a 0 | auxiliar de n� de 1 en fila
 		MOV R6, #0				//INICIALIZAR "j"
 bucleI:
 		CMP R4, R2 				//for (i=0;i<nfilas;i++)
		BGE finbucleI
 		STR	R5, [R1,R4,LSL#2] 	// vector[i]=0

 bucleJ:
 		CMP R6, R3
 		BGE finbucleJ			//for (j=0; j<ncols; j++)
		MUL R7, R4, R2			//R7 = i * nfilas
		ADD R7, R7, R6			//R7 = i * nfilas+ j  (posicion del elemento en la matriz tomada unidimensionalmente)
		LDR R8, [R0,R7,LSL#2]	//R8 = mat[i][j]
		CMP R8, #1				// if(mat[i][j] == 1)
		BNE not1
		ADD R5, R5, #1			//incremento del numero de 1 encontrados
		STR R5, [R1,R4,LSL#2]	//vector[i]++
not1:
		ADD R6, R6, #1			//incrementar contador j
		B bucleJ

finbucleJ:
		MOV R6, #0 				//reinicar contador "j"
 		ADD R4, R4, #1			//icrementar contador "i"
 		B bucleI

finbucleI:
		POP {R4,R5,R6,R7,R8}	//ep�logo
  		bx lr


 /*
 subrutina void Gray2BinaryMatrix(int orig[N][M], int dest[N][M], int nfilas, int ncols)


 .global Gray2BinaryMatrix

 .text

 /*
 R0		DIRECCION DE LA MATRIZ ORIGINAL DE GRISES
 R1		DIRECCION DE LA AMTRIZ DESTINO DE BLANCO/NEGRO
 R2		VALOR DEL NUMERO DE FILAS DE LA MATRIZ
 R3		VALOR DEL NUMERO DE COLUMNAS DE LA MATRIZ
 */

 /*
 Gray2BinaryMatrix:
 		PUSH {R4,R5,R6,R7,R8}
 		MOV R4, #0			//inicializar contador de i
 		MOV R5, #0			//inicializar contador de j
 		mov R6, #127		//inicializa UMBRAL

 buclefor1:
 		CMP R4, R2			// for (i=0;i<nfilas;i++)
 		BGE finfor1
 buclefor2:
 		CMP R5, R3			// for (j=0; j<ncols; j++)
 		BGE finfor2

 		B buclefor2

 finfor2:
 		B buclefor1

 finfor1:
 		POP {R4,R5,R6,R7,R8}
 		BX LR


 */
