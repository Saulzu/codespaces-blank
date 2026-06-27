package Vehiculo;

import java.util.ArrayList;
import java.util.Collections;

public class Main {
    public static void main(String[] args) {

        Vehiculo auto1 = new Auto("Toyota", "Corolla", 2022, 4);
        Vehiculo camion1 = new Camion("Volvo", "FH", 2020, 18.5);
        Vehiculo moto1 = new Motocicleta("Yamaha", "R6", 2023, 600);

        Vehiculo[] flota = new Vehiculo[3];
        flota[0] = auto1;
        flota[1] = camion1;
        flota[2] = moto1;

        for (Vehiculo v : flota) {
            v.mostrarInformacion();
            System.out.println("Costo de Servicio: $" + v.calcularCostoServicio());
        }

        System.out.println("\n");

        ArrayList<Vehiculo> flotilla = new ArrayList<>();
        flotilla.add(auto1);
        flotilla.add(camion1);
        flotilla.add(moto1);

        for (Vehiculo v : flotilla) {
            v.mostrarInformacion();
            System.out.println("Costo de Servicio: $" + v.calcularCostoServicio());
        }

        Collections.sort(flotilla);

        System.out.println("\n");

        for (Vehiculo v : flotilla) {
            v.mostrarInformacion();
            System.out.println("Costo de Servicio: $" + v.calcularCostoServicio());
        }
        
    }
}

