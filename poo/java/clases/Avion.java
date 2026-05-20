import java.util.Scanner;

public class Avion {
    
    private String origen;
    private String destino;
    private int numPasajeros;
    private String aerolinea;
    private String horaSalida;
    private String horaLlegada;
    private boolean enVuelo;
    private double altitudActual;

    public Avion() {
        this.origen = "CDMX";
        this.destino = "Cancún";
        this.numPasajeros = 0;
        this.aerolinea = "Aeroméxico";
        this.horaSalida = "08:00";
        this.horaLlegada = "10:15";
        this.enVuelo = false;
        this.altitudActual = 0.0;
    }

    public Avion(String orig, String dest, String aero) {
        this.origen = orig;
        this.destino = dest;
        this.numPasajeros = 0;
        this.aerolinea = aero;
        this.horaSalida = "12:00";
        this.horaLlegada = "14:00";
        this.enVuelo = false;
        this.altitudActual = 0.0;
    }

    public String getOrigen() {
        return origen; }
    public void setOrigen(String orig) { 
        this.origen = orig; }

    public String getDestino() { 
        return destino; }
    public void setDestino(String dest) { 
        this.destino = dest; }

    public int getNumPasajeros() {
        return numPasajeros; }
    public void setNumPasajeros(int num) { 
        this.numPasajeros = num; }

    public String getAerolinea() { 
        return aerolinea; }
    public void setAerolinea(String aero) { 
        this.aerolinea = aero; }

    public String getHoraSalida() { 
        return horaSalida; }
    public void setHoraSalida(String salida) { 
        this.horaSalida = salida; }

    public String getHoraLlegada() { 
        return horaLlegada; }
    public void setHoraLlegada(String llegada) { 
        this.horaLlegada = llegada; }

    public boolean isEnVuelo() { 
        return enVuelo; }
    public void setEnVuelo(boolean estado) { 
        this.enVuelo = estado; }

    public double getAltitudActual() { 
        return altitudActual; }
    public void setAltitudActual(double alt) { 
        this.altitudActual = alt; }

    public void despegar() {
        if (!enVuelo) {
            enVuelo = true;
            altitudActual = 30000.0;
            System.out.println("El vuelo de " + aerolinea + " con rumbo a " + destino 
                                + " ha despegado a las " + horaSalida);
        } else {
            System.out.println("El avión ya despegó " + destino);
        }
    }

    public void aterrizar() {
        if (enVuelo) {
            enVuelo = false;
            altitudActual = 0.0;
            System.out.println("El avión de " + aerolinea + " ha aterrizado con éxito en " 
                                + destino + " a las " + horaLlegada);
        } else {
            System.out.println("El avión está en el aeropuerto de origen (" + origen + ")");
        }
    }

    public static void main(String[] args) {
        Avion miAvion = new Avion("CDMX", "Tokio", "Berlin");
        Scanner leer = new Scanner(System.in);
        int opcion = 0;

        while (opcion != 3) {
            System.out.println("\nAviones: (" + miAvion.getAerolinea() + ")");
            System.out.println("Origen: " + miAvion.getOrigen() + " -> Destino: " + miAvion.getDestino());
            System.out.println("1. Despegar");
            System.out.println("2. Aterrizar");
            System.out.println("3. Volver / Salir");
            System.out.print("Seleccione una accion: ");
            
            opcion = leer.nextInt();

            if (opcion == 1) {
                miAvion.despegar();
            } else if (opcion == 2) {
                miAvion.aterrizar();
            } else if (opcion != 3) {
                System.out.println("Opcion invalida");
            }
        }
    }
}