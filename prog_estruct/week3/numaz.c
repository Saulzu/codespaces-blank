#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int azar(int inicio, int fin) {
    int num;
    num = inicio + rand() % (fin-inicio+1);
    return num;
}

int main() {
    int numAzar;
    int numUsuario;
    srand (time(NULL));

    numAzar = azar(1, 10);

    printf("El núm. aleatorio es: %d\n", numAzar);
    return 0;
}


