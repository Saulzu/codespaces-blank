#include <stdio.h>
#include <math.h>

int main() 
{
    float x1 = 2.5;
    float y1 = 4.5;
    float x2 = 5.2;
    float y2 = 1.5;
    float xp;
    float yp;
    float d1 = 0;
    float d2 = 0;

    printf("Ingresa la coordenada X del pasajero:");
    scanf("%f", &xp);
    printf("Ingresa la coordenada Y del pasajero:");
    scanf("%f", &yp);
    
    d1 = sqrt(((x1-xp)*(x1-xp))+((y1-yp)*(y1-yp)));
    d2 = sqrt(((x2-xp)*(x2-xp))+((y2-yp)*(y2-yp)));

    printf("La distacia al primer uber es: %f", d1);
    printf("La distacia al segundo uber es: %f", d2);

    if(d1<d2){
        printf("El pasajero esta mas cerca del Uber 1");
    } else {
        printf("El pasajero esta mas cerca del Uber 2");
    }
    return 0;
}