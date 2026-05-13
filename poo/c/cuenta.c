#include <stdio.h>
#include <string.h>
typedef struct {
    int numeroCuenta;
    char titular[50];
    float saldo;
} Cuenta;

void depositar(Cuenta *c, float cantidad) {
    if (cantidad > 0) {
        c->saldo += cantidad;
        printf("Depósito exitoso de $%.2f\n", cantidad);
    } else {
        printf("La cantidad a depositar debe ser positiva.\n");
    }
}

void retirar(Cuenta *c, float cantidad) {
    if (cantidad <= c->saldo) {
        c->saldo -= cantidad;
        printf("Retiro exitoso de $%.2f\n", cantidad);
    } else {
        printf("Fondos insuficientes para retirar $%.2f\n", cantidad);
    }
}

void mostrarCuenta(Cuenta c) {
    printf("\nInformación de la Cuenta\n");
    printf("Número de Cuenta: %d\n", c.numeroCuenta);
    printf("Titular: %s\n", c.titular);
    printf("Saldo Actual: $%.2f\n", c.saldo);
}

int main() {
    Cuenta c1;
    c1.numeroCuenta = 85697;
    strcpy(c1.titular, "Saul Z.");
    c1.saldo = 2000.0;
    mostrarCuenta(c1);

    depositar(&c1, 403.00);
    retirar(&c1, 200.00);
    retirar(&c1, 3050.00); 

    mostrarCuenta(c1);
    return 0;
}
