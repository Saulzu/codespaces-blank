import java.util.Scanner;

public class Planta {
    private String tipo;
    private double nivelHumedad;
    private double crecimiento;
    private boolean sol;

    public Planta() {
        this.tipo = "Helecho";
        this.nivelHumedad = 60.0;
        this.crecimiento = 10.0;
        this.sol = false;
    }

    public Planta(String t, double crecimientoInicial) {
        this.tipo = t;
        this.nivelHumedad = 50.0;
        this.crecimiento = crecimientoInicial;
        this.sol = false;
    }

    public String getTipo() { 
        return tipo; }
    public void setTipo(String t) { 
        this.tipo = t; }

    public double getNivelHumedad() { 
        return nivelHumedad; }
    public void setNivelHumedad(double hum) { 
        if (hum >= 0 && hum <= 100) {
            this.nivelHumedad = hum; 
        }
    }

    public double getCrecimiento() { 
        return crecimiento; }
    public void setCrecimiento(double crec) { 
        if (crec >= 0 && crec <= 100) {
            this.crecimiento = crec; 
        }
    }

    public boolean isSol() { 
        return sol; }
    public void setSol(boolean s) { 
        this.sol = s; }

    public void regar() {
        nivelHumedad += 25.0;
        if (nivelHumedad > 100.0) nivelHumedad = 100.0;
        
        crecimiento += 5.0;
        if (crecimiento > 100.0) crecimiento = 100.0;
        
        System.out.println("\n Has regado tu " + tipo + ". Humedad: " + nivelHumedad + "%");
    }

    public void transplantar() {
        if (crecimiento >= 80.0) {
            System.out.println("\nTransplante - Tu " + tipo + " estaba al " + crecimiento 
                                + "% de capacidad y ahora tiene una maceta mas grande");
            crecimiento = 20.0; 
        } else {
            System.out.println("\n No es necesario transplantar");
        }
    }

    public static void main(String[] args) {
        Planta miPlanta = new Planta("Cactus", 85.0);
        Scanner leer = new Scanner(System.in);
        int opcion = 0;

        while (opcion != 3) {
            System.out.println("\nPlanta(" + miPlanta.getTipo() + ") ");
            System.out.println("Humedad: " + miPlanta.getNivelHumedad() + "% | Raiz: " + miPlanta.getCrecimiento() + "%");
            System.out.println("1. Regar planta");
            System.out.println("2. Transplantar");
            System.out.println("3. Volver / Salir");
            System.out.print("Seleccione una accion: ");

            opcion = leer.nextInt();

            if (opcion == 1) {
                miPlanta.regar();
            } else if (opcion == 2) {
                miPlanta.transplantar();
            } else if (opcion != 3) {
                System.out.println("Opcion invalida");
            }
        }
    }
}