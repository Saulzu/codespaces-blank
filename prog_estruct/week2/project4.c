#include <stdio.h>
#include <math.h>

int main(){
    float vel, angulo, dis;
    float dbala, dif;
    float g = 9.81;

    printf("Velocidad (m/s): ");
    scanf("%f", &vel);

    printf("Angulo (grados): ");
    scanf("%f", &angulo);

    printf("Distancia a la diana (m): ");
    scanf("%f", &dis);

    angulo = angulo * M_PI / 180.0;

    dbala = (pow(vel, 2)*(sin(2*angulo)))/g;

    dif = dis - dbala;

    printf("%f", fabs(dif));

    if(fabs(dif) <= 0.5){
        printf("Le atinaste al centro\n");
        printf("Tienes 10 puntos");
    } else if(fabs(dif) <= 1.0){
        printf("Estuviste cerca\n");
        printf("Tienes 7 puntos");
    } else if(fabs(dif) <= 1.5) {
        printf("Estuviste un poco cerca\n");
        printf("Tienes 7 puntos");
    } else {
        printf("Estuviste muy lejos\n");
        printf("Tienes 0 puntos");
    }
    return 0;
}