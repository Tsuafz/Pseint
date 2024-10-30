Algoritmo Elgato_gaming
	Algoritmo TaTeTi
		
		Dimension Tab1[3,3];
		Dimension Tab2[3,3];
		
		Para i<-1 Hasta 3 Hacer
			Para j<-1 Hasta 3 Hacer
				Tab1[i,j]<-0;
				Tab2[i,j]<-" ";
			FinPara
		FinPara
		
		TurnoJugador1<-Verdadero;
		Terminado<-Falso;
		Ganador<-Falso;
		CantTurnos<-0;
		
		Mientras ~ Terminado hacer
			// dibuja el tablero
			Borrar Pantalla;
			Escribir " ";
			Escribir "      ||     ||     ";
			Escribir "   ",Tab2[1,1],"  ||  ",Tab2[1,2],"  ||  ",Tab2[1,3];
			Escribir "     1||    2||    3";
			Escribir " =====++=====++======";
			Escribir "      ||     ||     ";
			Escribir "   ",Tab2[2,1],"  ||  ",Tab2[2,2],"  ||  ",Tab2[2,3];
			Escribir "     4||    5||    6";
			Escribir " =====++=====++======";
			Escribir "      ||     ||     ";
			Escribir "   ",Tab2[3,1],"  ||  ",Tab2[3,2],"  ||  ",Tab2[3,3];
			Escribir "     7||    8||    9";
			Escribir " ";
			
			Si ~ Ganador y CantTurnos<9 Entonces
				Si TurnoJugador1 Entonces
					Ficha<-'O'; Valor<- 1; Objetivo<-1;
					Escribir "Turno del jugador 1 (X)";
					// Pide la posición para colocar la ficha
					Escribir "Ingrese la Posición (1-9):";
					Repetir
						Leer Pos;
						i<-trunc((Pos-1)/3)+1;
						j<-((Pos-1) MOD 3)+1;
						Si Pos<1 o Pos>9 o Tab1[i,j]<>0 Entonces
							Escribir "Posición incorrecta, ingrese nuevamente: ";
							Pos<-99;
						FinSi
					Hasta Que Pos<>99
				SiNo
					// Movimiento de la máquina
					Repetir
						Pos<-random(1, 9);
						i<-trunc((Pos-1)/3)+1;
						j<-((Pos-1) MOD 3)+1;
					Hasta Que Tab1[i,j]=0
					Ficha<-'X'; Valor<- 2; Objetivo<-8;
					Escribir "Turno de la máquina (O)";
				FinSi
				
				// guarda la ficha en la matriz tab2 y el valor en tab1
				CantTurnos<-CantTurnos+1;
				Tab1[i,j]<-Valor;
				Tab2[i,j]<-Ficha;
				
				// Verificar si hay un ganador
				Ganador <- VerificarGanador(Tab1, Objetivo);
				
				Si ~ Ganador Entonces
					TurnoJugador1 <- ~ TurnoJugador1;
				FinSi
				
			SiNo
				Si Ganador Entonces
					Escribir "Ganador: ";
					Si TurnoJugador1 Entonces
						Escribir "Jugador 1!";
					SiNo
						Escribir "Máquina!";
					FinSi
				SiNo
					Escribir "Empate!";
				FinSi
				Terminado<-Verdadero;
			FinSi
			
		FinMientras
		
FinAlgoritmo

Funcion VerificarGanador(Tab1, Objetivo) Como Booleano
	aux_d1<-1; aux_d2<-1;
	
	Para i<-1 Hasta 3 Hacer
		aux_i<-1; aux_j<-1;
		aux_d1<-aux_d1*Tab1[i,i];
		aux_d2<-aux_d2*Tab1[i,4-i];
		Para j<-1 Hasta 3 Hacer
			aux_i<-aux_i*Tab1[i,j];
			aux_j<-aux_j*Tab1[j,i];
		FinPara
		Si aux_i=Objetivo o aux_j=Objetivo Entonces
			Retornar Verdadero;
		FinSi
	FinPara
	
	Si aux_d1=Objetivo o aux_d2=Objetivo Entonces
		Retornar Verdadero;
	SiNo
		Retornar Falso;
	FinSi
FinFuncion
