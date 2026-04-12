#include <stdio.h>
#include <math.h>

#define G 9.81
#define PI 3.141592653589793

int main() {
    double v, angulo, D;
    double dbala, diferencia;

    printf("Velocidad (m/s): ");
    scanf("%lf", &v);

    printf("Angulo (grados): ");
    scanf("%lf", &angulo);

    printf("Distancia a la diana (m): ");
    scanf("%lf", &D);

    angulo = angulo * PI / 180.0;
    dbala = (v * v * sin(2 * angulo)) / G;

    diferencia = dbala - D;

    if (diferencia == 0) {
        printf("Disparo perfecto, centro exacto.\n");
    } else if (diferencia > 0) {
        printf("El disparo se paso %.2f metros de la diana.\n", diferencia);
    } else {
        printf("El disparo cayo %.2f metros antes de la diana.\n", fabs(diferencia));
    }

    return 0;
}
