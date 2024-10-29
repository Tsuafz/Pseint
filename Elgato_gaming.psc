Algoritmo Elgato_gaming
	
	// Declaraci�n de variables
	Dimension tablero[3,3];
	Dimension tablero2[3,3];
	Definir tablero, ganador Como Caracter;
	ganador = " ";
	Definir fila, columna, opciones, tablero2 como entero;
	
	// Inicializar tablero
	para i = 1 hasta 3 Hacer
		para j = 1 hasta 3 Hacer
			tablero[i,j] = " ";
		FinPara
	FinPara
	
	// Men� principal 
	Repetir
		Escribir "1: Jugar (T� empiezas)";
		Escribir "2: Jugar (La maquina empieza)";
		Escribir "3: Salir";
		Leer opciones;
		Segun opciones Hacer
			1:
				// Jugador empieza
				ImprimirTablero(tablero);
			2:
				// Maquina empieza
				ImprimirTablero(tablero);
			3:
				Escribir "Saliendo del juego...";
			De Otro Modo:
				Escribir "Opci�n invalida";
		FinSegun
	Hasta Que opciones = 3;
FinAlgoritmo

	
// Funci�n para imprimir tablero
SubProceso ImprimirTablero(tablero)
	Borrar Pantalla;
	Escribir " ";
	Escribir "      ||     ||     ";
	Escribir "   ",tablero[1,1],"  ||  ",tablero[1,2],"  ||  ",tablero[1,3];
	Escribir "     1||    2||    3";
	Escribir " =====++=====++======";
	Escribir "      ||     ||     ";
	Escribir "   ",tablero[2,1],"  ||  ",tablero[2,2],"  ||  ",tablero[2,3];
	Escribir "     4||    5||    6";
	Escribir " =====++=====++======";
	Escribir "      ||     ||     ";
	Escribir "   ",tablero[3,1],"  ||  ",tablero[3,2],"  ||  ",tablero[3,3];
	Escribir "     7||    8||    9";
	Escribir " ";
FinSubProceso

// Funci�n para realizar un movimiento
SubProceso RealizarMovimiento(tablero,fila,columna,simbolo)