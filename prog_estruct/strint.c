#include <stdio.h>

int main() {
    char linea[100];
    int x;

    printf("Ingresa un numero: ");
    fgets(linea, sizeof(linea), stdin);

    if (sscanf(linea, "%d", &x) != 1) {
        printf("Entrada invalida\n");
    } else {
        printf("Numero: %d\n", x);
    }

    return 0;
}