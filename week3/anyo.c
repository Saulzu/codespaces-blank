#include <stdio.h>

int main() {
    int year;

    printf("Introduce el año: ");
    scanf("%d", &year); 

    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
        printf("El año %d sí es bisiesto.\n", year);
    } else {
        printf("El año %d no es bisiesto.\n", year);
    }

    return 0;
}