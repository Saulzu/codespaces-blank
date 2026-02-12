#include <stdio.h>

int main() {
    
    int lim, n = 0, sma = 0;
    printf("Ingresa un entero límite: ");
    scanf("%d", &lim);

    while (sma <= lim){
        sma = sma + n;
        n = n + 1;
    }

    printf("El valor de n es: %d\n", n-2);

    return 0;
}