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

    if(dis == dbala){
        printf("Le atinaste al centro");
    } else if(dif < 0){
        printf("Estuviste cerca, cayo antes %.2f", fabs(dbala));
    } else {
        printf("Estuviste cerca, cayo despues %f", fabs(dif));
    }
    return 0;
}