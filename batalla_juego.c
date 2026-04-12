// Estas funciones AHORA no tienen parámetros, pero conforme
// avancemos, TENEMOS que poner los parámetros necesarios
// de cada función.

#include <stdio.h>
#include "batalla_juego.h"
#include "biblio_printconsola.h"

int leerTiradaValida(int maxR, int maxC, int* outRen, int* outCol) {
    int fila, col;
    int leidoFila, leidoCol;

    do {
        printf("Ingresa la fila (1-%d): ", maxR);
        leidoFila = scanf("%d", &fila);

        if (leidoFila != 1 || fila < 1 || fila > maxR) {
            printf("Fila inválida. Intenta de nuevo.\n");
            leidoFila = 0; // Forzamos repetir si el rango está mal
        }

        printf("Ingresa la columna (1-%d): ", maxC);
        leidoCol = scanf("%d", &col);

        if (leidoCol != 1 || col < 1 || col > maxC) {
            printf("Columna inválida. Intenta de nuevo.\n");
            leidoCol = 0;
        }

    } while (leidoFila != 1 || leidoCol != 1);

    *outRen = fila - 1;
    *outCol = col - 1;

    return 1;
}

int marcarTiro(Tablero* objetivo, int fila, int col) {
    int actual = objetivo->array[fila][col];

    if (actual == BARCO_HUNDIDO || actual == TIRO_CAIDO) {
        return -1;
    }

    if (actual == BARCO_OCULTO) {
        objetivo->array[fila][col] = BARCO_HUNDIDO;
        return 1;
    }

    objetivo->array[fila][col] = TIRO_CAIDO;
    return 0;
}

void desplegarMarcadores(Jugador j1, Jugador j2) {
   int colJ1 = 5;
   int colJ2 = 50;
   int despl = colJ2 - colJ1;

   desplegarMarcador(j1, 1, colJ1);
   desplegarMarcador(j2, 1, colJ1+despl);
}

void desplegarMarcador(Jugador player, int ren, int col) {
   char mensaje[100];
   sprintf(mensaje, "Jugador %s: %s", player.emoji, player.nombre);
   printRenCol(ren, col, mensaje, BLANCO);

   sprintf(mensaje, "Barcos activos : %d", player.nBarcosVivos);
   printRenCol(ren+1, col, mensaje, VERDE);

   sprintf(mensaje, "Barcos hundidos: %d", player.nBarcosHundidos);
   printRenCol(ren+2, col, mensaje, ROJO);

   printf("\e[0m\n");
}

void guiaTopTablero(int numCols, int espaciosI) {
   printf("%*s", espaciosI, "");
   printf("   ");
   for (int col = 1; col <= numCols; col++) {
      printf(" %2d", col);
   }
}

void dibujaTablero(Tablero tablero, int fila, int mostrarBarcos, int espaciosI) {
   printf("%*s", espaciosI, "");
   
   printf("%2d ", fila + 1);
   for (int col = 0; col < tablero.numCols; col++) {
         int valor = tablero.array[fila][col];
         char simbolo = '~';

         if (valor == BARCO_HUNDIDO) {
            simbolo = 'X';
         } else if (valor == TIRO_CAIDO) {
            simbolo = 'O';
         } else if (valor == BARCO_OCULTO && mostrarBarcos) {
            simbolo = 'W';
         }

      printf("  %c", simbolo);
   }
}

void desplegarTableros(Tablero propio, Tablero enemy, Jugador* atacante, Jugador* defensor) {
    int colJ1 = 5;
    int colJ2 = 50;
    int separacionEntreTableros = colJ2 - colJ1;

    printf("\n");
    imprimirCabeceraTableros(*atacante, *defensor);
    printf("\n");

    imprimirCabeceraColumnas(propio.numCols, colJ1);
    
    int anchoTablero = 3 + (propio.numCols * 3); 
    int espaciosAlSegundo = separacionEntreTableros - anchoTablero;
    
    imprimirCabeceraColumnas(enemy.numCols, espaciosAlSegundo);
    printf("\n");

   int filas;
   if (propio.numRens < enemy.numRens)
      filas = propio.numRens;
   else
      filas = enemy.numRens;

   for (int fila = 0; fila < filas; fila++) {
      imprimirFilaTablero(propio, fila, 1, colJ1);
      printf("%*s", espaciosAlSegundo, "");
      imprimirFilaTablero(enemy, fila, 0, 0);
      printf("\n");
   }
}

void jugar(Tablero* t1, Tablero* t2, Jugador* j1, Jugador* j2) {
   Tablero* propio = t1;
   Tablero* enemigo = t2;
   Jugador* atacante = j1;
   Jugador* defensor = j2;

   cursorInvisible();
   while (j1->nBarcosVivos > 0 && j2->nBarcosVivos > 0) {
      limpiaConsola();
        
      printf("\n");
      printf("\e[38;5;255m");
      printf("          ════ TURNO DE BATALLA ═══════\n");
      printf("           %s %s%*s\n", atacante->emoji, atacante->nombre, 
             (int)(20 - strlen(atacante->nombre)), "");
      printf("          ═════════════════════════════\n");
      printf("\e[0m\n");
      
      printf("Barcos propios: %d | Barcos enemigos restantes: %d\n\n",
             atacante->nBarcosVivos, defensor->nBarcosVivos);
      mostrarTableros(*propio, *enemigo, atacante, defensor);
      int fila, col;
      printf("\n");
      if (!leerTiradaValida(propio->numRens, propio->numCols, &fila, &col)) {
          printf("\e[38;5;196mEntrada inválida. Saliendo del juego.\e[0m\n");
          cursorVisible();
          return;
      }
      int resultado = marcarTiro(enemigo, fila, col);
      if (resultado == -1) {
         printf("\e[38;5;46mYa disparaste ahi. ENTER para continuar...\e[0m\n");
         cursorVisible();
         getchar();
         cursorInvisible();
         continue;
      }

      if (resultado == 1) {
         defensor->nBarcosVivos--;
         defensor->nBarcosHundidos++;
         printf("\e[38;5;196m");
         printf("╔════════════════════════════════╗\n");
         printf("║   ¡IMPACTO! BARCO HUNDIDO      ║\n");
         printf("╚════════════════════════════════╝\e[0m\n");
      } else {
         printf("\e[38;5;51m");
         printf("╔════════════════════════════════╗\n");
         printf("║        AGUA - FALLO            ║\n");
         printf("╚════════════════════════════════╝\e[0m\n");
      }

      printf("\e[0m\n");
        
      mostrarTableros(*propio, *enemigo, atacante, defensor);
      printf("Presiona ENTER para continuar...");
      cursorVisible();
      getchar();
      cursorInvisible();

      if (j1->nBarcosVivos == 0 || j2->nBarcosVivos == 0) {
         break;
      }

      if (atacante == j1) {
         atacante = j2;
         defensor = j1;
         propio = t2;
         enemigo = t1;
      } else {
         atacante = j1;
         defensor = j2;
         propio = t1;
         enemigo = t2;
      }
   }
}
