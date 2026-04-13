// Estas funciones AHORA no tienen parámetros, pero conforme
// avancemos, TENEMOS que poner los parámetros necesarios
// de cada función.
#include "batalla_tipos.h"

/*
Función principal para realizar el juego. En un ciclo alterna las tiradas de
los jugadores leyendo dónde dejarán caer su disparo en el tablero.
*/
void jugar(Tablero* t1, Tablero* t2, Jugador* j1, Jugador* j2);

/*
Despliega los marcadores de ambos juadores en el renglón 
y columna dadas de la consola.
*/
void desplegarMarcadores(Jugador j1, Jugador j2);

/*
Despliega el macador de jugador dado en el renglón y 
columna de la consola.
*/
void desplegarMarcador(Jugador player, int ren, int col);

/*
Dibuja ambos tableros comenzando en el renglón y columna dados.
*/
void desplegarTableros(Tablero propio, Tablero enemy, Jugador* atacante, Jugador* defensor);

/*
Dibuja un tablero en el renglón y columna dados.
*/
void dibujaTablero(Tablero tablero, int fila, int mostrarBarcos, int espaciosI);

int leerTiradaValida(int maxR, int maxC, int* outRen, int* outCol);

int marcarTiro(Tablero* objetivo, int fila, int col);


