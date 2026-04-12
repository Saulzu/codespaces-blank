#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <string.h>
#include <math.h> 
#include "batalla_config.c"
#include "batalla_config.h"
#include "batalla_juego.c"
#include "batalla_juego.h"
#include "batalla_tableros.c"
#include "batalla_tableros.h"
#include "batalla_tipos.h"
#include "biblio_printconsola.c"
#include "biblio_printconsola.h"

int main()
{
    srand((unsigned) time(NULL));

    Tablero mapaJ1;
    Tablero mapaJ2;
    Jugador player1;
    Jugador player2;

    leerConfigJuego(&mapaJ1, &mapaJ2, &player1, &player2);

    player1.nBarcosVivos = player1.nBarcosTotal;
    player1.nBarcosHundidos = 0;
    player2.nBarcosVivos = player2.nBarcosTotal;
    player2.nBarcosHundidos = 0;

    prepararTableros(&mapaJ1, &mapaJ2);

    sembrarBarcos(&mapaJ1);
    sembrarBarcos(&mapaJ2);

    jugar(&mapaJ1, &mapaJ2, &player1, &player2);

    destruyeTableros(&mapaJ1, &mapaJ2);

    return 0;
}

