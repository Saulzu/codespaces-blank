#include <iostream>
#include <string>
using namespace std;

class Zapato {
private:
    string tipo;
    int talla;
    string color;
    string marca;
    bool limpio;

public:
    Zapato() : tipo("Running"), talla(42), color("Negro"), marca("Nike"), limpio(true) {}

    Zapato(string t, int tal, string m) : tipo(t), talla(tal), color("Blanco"), marca(m), limpio(true) {}

    string getTipo() const { 
        return tipo; }
    void setTipo(string t) { 
        tipo = t; }

    int getTalla() const { 
        return talla; }
    void setTalla(int tal) { 
        talla = tal; }

    string getColor() const { 
        return color; }
    void setColor(string c) { 
        color = c; }

    string getMarca() const { 
        return marca; }
    void setMarca(string m) { 
        marca = m; }

    bool isLimpio() const { 
        return limpio; }
    void setLimpio(bool l) { 
        limpio = l; }

    void usar() {
        if (limpio) {
            limpio = false;
            cout << "\nHas salido a caminar con tus " << marca << " (" << tipo << "). Se han ensuciado\n";
        } else {
            cout << "\nTus zapatos " << marca << " ya estaban sucios, pero los usaste.\n";
        }
    }

    void limpiarZapato() {
        if (!limpio) {
            limpio = true;
            cout << "\nHas lavado tus " << tipo << " de la marca " << marca << endl;
        } else {
            cout << "\nYa están limpios\n";
        }
    }
};

int main() {
    Zapato miZapato("Casual", 41, "Adidas");
    int opcion = 0;

    while (opcion != 3) {
        cout << "\nZAPATO (" << miZapato.getMarca() << ")" << endl;
        cout << "Estado: " << (miZapato.isLimpio() ? "Limpio" : "Sucio") << endl;
        cout << "1. Usar zapato" << endl;
        cout << "2. Limpiar zapato" << endl;
        cout << "3. Volver / Salir" << endl;
        cout << "Seleccione una accion: ";
        cin >> opcion;

        if (opcion == 1) miZapato. usar();
        else if (opcion == 2) miZapato.limpiarZapato();
        else if (opcion != 3) cout << "Opcion invalida\n";
    }
    return 0;
}