#include <iostream>
#include <string>
using namespace std;

class Planta {
private:
    string tipo;
    double nivelHumedad;
    double crecimiento;
    bool sol;

public:
    Planta() : tipo("Helecho"), nivelHumedad(60.0), crecimiento(10.0), sol(false) {}

    Planta(string t, double crecimientoInicial) 
        : tipo(t), nivelHumedad(50.0), crecimiento(crecimientoInicial), sol(false) {}

    string getTipo() const { 
        return tipo; }
    void setTipo(string t) { 
        tipo = t; }

    double getNivelHumedad() const { 
        return nivelHumedad; }
    void setNivelHumedad(double hum) { 
        if(hum >= 0 && hum <= 100) nivelHumedad = hum; }

    double getCrecimiento() const { 
        return crecimiento; }
    void setCrecimiento(double crec) { 
        if(crec >= 0 && crec <= 100) crecimiento = crec; }

    bool isSol() const { 
        return sol; }
    void setSol(bool s) { 
        sol = s; }

    void regar() {
        nivelHumedad += 25.0;
        if (nivelHumedad > 100.0) nivelHumedad = 100.0;
        crecimiento += 5.0;
        if (crecimiento > 100.0) crecimiento = 100.0;
        cout << "\n Has regado tu " << tipo << ". Humedad: " << nivelHumedad << "%\n";
    }

    void transplantar() {
        if (crecimiento >= 80.0) {
            cout << "\nTransplante - Tu " << tipo << " estaba al " << crecimiento 
                      << "% de capacidad y ahora tiene una maceta mas grande\n";
            crecimiento = 20.0; 
        } else {
            cout << "\n No es necesario transplantar";
        }
    }
};

int main() {
    Planta miPlanta("Cactus", 85.0);
    int opcion = 0;

    while (opcion != 3) {
        cout << "\nPlanta(" << miPlanta.getTipo() << ") " << endl;
        cout << "Humedad: " << miPlanta.getNivelHumedad() << "% | Raiz: " << miPlanta.getCrecimiento() << "%" << endl;
        cout << "1. Regar planta" << endl;
        cout << "2. Transplantar" << endl;
        cout << "3. Volver / Salir" << endl;
        cout << "Seleccione una accion: ";
        cin >> opcion;

        if (opcion == 1) miPlanta.regar();
        else if (opcion == 2) miPlanta.transplantar();
        else if (opcion != 3) cout << "Opcion invalida\n";
    }
    return 0;
}