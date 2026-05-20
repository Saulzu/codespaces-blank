#include <iostream>
using namespace std;

int main() {
    int numero;

    cout << "Introduce un numero: ";
    cin >> numero;

    if (numero > 0) {
        cout << "El numero es positivo." << endl;
    } else if (numero < 0) {
        cout << "El numero es negativo." << endl;
    } else {
        cout << "El numero es cero." << endl;
    }

    if (numero % 2 == 0) {
        cout << "El numero es par." << endl;
    } else {
        cout << "El numero es impar." << endl;
    }

    return 0;
}