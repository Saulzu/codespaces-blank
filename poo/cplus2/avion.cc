#include <iostream>
#include <string>
using namespace std;

class Avion {
    
private:
    string origen;
    string destino;
    int numPasajeros;
    string aerolinea;
    string horaSalida;
    string horaLlegada;
    bool enVuelo;
    double altitudActual;

public:
    Avion() : origen("CDMX"), destino("Cancún"), numPasajeros(0), aerolinea("Aeroméxico"), 
              horaSalida("08:00"), horaLlegada("10:15"), enVuelo(false), altitudActual(0.0) {}

    Avion(string orig, string dest, string aero): 
        origen(orig), destino(dest), numPasajeros(0), aerolinea(aero), 
          horaSalida("12:00"), horaLlegada("14:00"), enVuelo(false), altitudActual(0.0) {}

    string getOrigen() const {
        return origen; }
    void setOrigen(string orig) { 
        origen = orig; }

    string getDestino() const { 
        return destino; }
    void setDestino(string dest) { 
        destino = dest; }

    int getNumPasajeros() const { 
        return numPasajeros; }
    void setNumPasajeros(int num) { 
        numPasajeros = num; }

    string getAerolinea() const { 
        return aerolinea; }
    void setAerolinea(string aero) { 
        aerolinea = aero; }

    string getHoraSalida() const { 
        return horaSalida; }
    void setHoraSalida(string salida) { 
        horaSalida = salida; }

    string getHoraLlegada() const { 
        return horaLlegada; }
    void setHoraLlegada(string llegada) { 
        horaLlegada = llegada; }

    bool isEnVuelo() const { 
        return enVuelo; }
    void setEnVuelo(bool estado) { 
        enVuelo = estado; }

    double getAltitudActual() const {
        return altitudActual; }
    void setAltitudActual(double alt) {
        altitudActual = alt; }

    void despegar() {
        if (!enVuelo) {
            enVuelo = true;
            altitudActual = 30000.0;
            cout << "El vuelo de " << aerolinea << " con rumbo a " << destino 
                      << " ha despegado a las " << horaSalida << ".\n";
        } else {
            cout << "El avión ya está en ruta hacia " << destino << ".\n";
        }
    }

    void aterrizar() {
        if (enVuelo) {
            enVuelo = false;
            altitudActual = 0.0;
            cout << "El avión de " << aerolinea << " ha aterrizado con éxito en " 
                      << destino << " a las " << horaLlegada << endl;
        } else {
            cout << "El avión ya está aeropuerto de origen (" << origen << ")\n";
        }
    }

};

int main() {
    Avion miAvion("CDMX", "Madrid", "Iberia");
    int opcion = 0;

    while (opcion != 3) {
        cout << "\n Aviones: (" << miAvion.getAerolinea() << ")" << endl;
        cout << "Origen: " << miAvion.getOrigen() << " -> Destino: " << miAvion.getDestino() << endl;
        cout << "1. Despegar" << endl;
        cout << "2. Aterrizar" << endl;
        cout << "3. Volver / Salir" << endl;
        cout << "Seleccione una accion: ";
        cin >> opcion;

        if (opcion == 1) miAvion.despegar();
        else if (opcion == 2) miAvion.aterrizar();
        else if (opcion != 3) cout << "Opcion invalida\n";
    }
    return 0;
}
