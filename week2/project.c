#include <stdio.h>
#include <math.h>

int main(){
    float vel, angulo, dis;
    float dbala, diferencia;
    float g = 9.81;

    printf("Velocidad (m/s): ");
    scanf("%f", &vel);

    printf("Angulo (grados): ");
    scanf("%f", &angulo);

    printf("Distancia a la diana (m): ");
    scanf("%f", &dis);

    angulo = angulo * M_PI / 180.0;

    dbala = (pow(vel, 2)*(sin(2*angulo)))/g;

    if(dis == dbala){
        printf("Le atinaste al centro");
    } else {
        printf("Estuviste cerca, cayo a %.3f", dbala);
    }
    return 0;
}