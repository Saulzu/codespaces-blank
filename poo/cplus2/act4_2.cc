#include <iostream>
using namespace std;

int main() {
    int n1, n2, n3, promd;

    cout << "Introduce las tres calificaciones: ";

    cin >> n1 >> n2 >> n3;

    promd = (n1 + n2 + n3) / 3;

    if(promd >= 6)
        cout << "El alumno aprobó" << endl;
    else 
        cout << "El alumno reprobó" << endl;
    

    cout << "El promedio es: " << promd;

    return 0;
}
