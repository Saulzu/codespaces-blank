#include <iostream>
#include <string>

// (Asegúrate de que las clases Avion, Zapato y Planta estén declaradas aquí o arriba)

void mostrarMenuPrincipal() {
    std::cout << "\n=== MENU PRINCIPAL ===" << std::endl;
    std::cout << "1. Gestionar Avion" << std::endl;
    std::cout << "2. Gestionar Zapato" << std::endl;
    std::cout << "3. Gestionar Planta" << std::endl;
    std::cout << "4. Salir" << std::endl;
    std::cout << "Seleccione una opcion: ";
}

int main() {
    // Creamos los objetos usando los constructores creados
    Avion miAvion("CDMX", "Madrid", "Iberia");
    Zapato miZapato("Casual", 41, "Adidas");
    Planta miPlanta("Cactus", 85.0); // Inicializada con 85% de crecimiento para probar el transplante

    int opcionPrincipal = 0;

    while (opcionPrincipal != 4) {
        mostrarMenuPrincipal();
        std::cin >> opcionPrincipal;

        if (opcionPrincipal == 1) {
            int opAvion = 0;
            std::cout << "\n--- SUBMENU AVION (" << miAvion.getAerolinea() << ") ---" << std::endl;
            std::cout << "1. Despegar" << std::endl;
            std::cout << "2. Aterrizar" << std::endl;
            std::cout << "Seleccione accion: ";
            std::cin >> opAvion;
            if (opAvion == 1) miAvion.despegar();
            if (opAvion == 2) miAvion.aterrizar();
        } 
        else if (opcionPrincipal == 2) {
            int opZapato = 0;
            std::cout << "\n--- SUBMENU ZAPATO (" << miZapato.getMarca() << ") ---" << std::endl;
            std::cout << "1. Usar zapato" << std::endl;
            std::cout << "2. Limpiar zapato" << std::endl;
            std::cout << "Seleccione accion: ";
            std::cin >> opZapato;
            if (opZapato == 1) miZapato.usar();
            if (opZapato == 2) miZapato.limpiarZapato();
        } 
        else if (opcionPrincipal == 3) {
            int opPlanta = 0;
            std::cout << "\n--- SUBMENU PLANTA (" << miPlanta.getTipo() << ") ---" << std::endl;
            std::cout << "1. Regar planta" << std::endl;
            std::cout << "2. Transplantar" << std::endl;
            std::cout << "3. Sacar al sol" << std::endl;
            std::cout << "Seleccione accion: ";
            std::cin >> opPlanta;
            if (opPlanta == 1) miPlanta.regar();
            if (opPlanta == 2) miPlanta.transplantar();
            if (opPlanta == 3) miPlanta.sacarAlSol();
        } 
        else if (opcionPrincipal == 4) {
            std::cout << "Saliendo del programa del sistema..." << std::endl;
        } 
        else {
            std::cout << "Opcion no valida, intente de nuevo." << std::endl;
        }
    }

    return 0;
}