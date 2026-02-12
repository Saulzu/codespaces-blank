#include <stdio.h>

int main() {
    float capI, r = 0.01, mm, a = 0;

    printf("Ingresa el capital inicial: ");
    scanf("%f", &capI);

    printf("Ingresa el monto objetivo: ");
    scanf("%f", &mm);

    while(capI < mm && r < 1.0){
        capI = capI * (1 + r);
        a = a + 1;
        if ((int)a % 2 == 0){
            r = r + 0.01;
        }
    }
    printf("Se tarda %f años", a);

    return 0;
}