#include <stdio.h>
#include <string.h>

typedef enum { HECHICERO, PALADIN, DRUIDA, GUERRERO, CAZADOR } ClaseHeroe;

typedef struct {
    char nombre[30];
    ClaseHeroe clase;
    int nivel;
    float vida;
    float ataque;
    int mana;
    float coins;
} Heroe;

void recMana(Heroe *h, int puntos) {
    h->mana += puntos;
    if (h->mana > 500) {
        h->mana = 500;
    }
    printf(">> %s recupero mana. Mana actual: %d\n", h->nombre, h->mana);
}

void comprarObjeto(Heroe *h, float costo) {
    if (h->coins >= costo) {
        h->coins -= costo;
        printf("Compra exitosa. Saldo restante: %.2f coins\n", h->coins);
    } else {
        printf("%s no tiene suficientes coins para esta compra.\n", h->nombre);
    }
}

void imprimirClase(ClaseHeroe c) {
    printf("Clase:   ");
    if (c == HECHICERO) printf("Hechicero\n");
    else 
        if (c == PALADIN) printf("Paladin\n");
        else 
            if (c == DRUIDA) printf("Druida\n");
            else
                if (c == GUERRERO) printf("Guerrero\n");
                else 
                    if (c == CAZADOR) printf("Cazador\n");
                    else printf("Desconocida\n");
}

void mostrarEstado(Heroe h) {
    printf("\nESTADO DEL HEROE\n");
    printf("Nombre:  %s\n", h.nombre);
    imprimirClase(h.clase);
    printf("Nivel:   %d\n", h.nivel);
    printf("Vida:    %.1f\n", h.vida);
    printf("Mana:    %d / 500\n", h.mana);
    printf("Coins:   %.2f\n", h.coins);
}

int main() {
    Heroe h1;

    strcpy(h1.nombre, "Gerald");
    h1.clase = DRUIDA;
    h1.nivel = 3;
    h1.vida = 95.0;
    h1.ataque = 20.0;
    h1.mana = 400;
    h1.coins = 100.0;

    mostrarEstado(h1);

    recMana(&h1, 150);       
    comprarObjeto(&h1, 45.0); 
    comprarObjeto(&h1, 80.0); 

    mostrarEstado(h1);

    return 0;
}