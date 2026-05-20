import java.util.Scanner;

public class Zapato {
    private String tipo;
    private int talla;
    private String color;
    private String marca;
    private boolean limpio;

    public Zapato() {
        this.tipo = "Running";
        this.talla = 42;
        this.color = "Negro";
        this.marca = "Nike";
        this.limpio = true;
    }

    public Zapato(String t, int tal, String m) {
        this.tipo = t;
        this.talla = tal;
        this.color = "Blanco";
        this.marca = m;
        this.limpio = true;
    }

    public String getTipo() { 
        return tipo; }
    public void setTipo(String t) { 
        this.tipo = t; }

    public int getTalla() { 
        return talla; }
    public void setTalla(int tal) { 
        this.talla = tal; }

    public String getColor() { 
        return color; }
    public void setColor(String c) { 
        this.color = c; }

    public String getMarca() { 
        return marca; }
    public void setMarca(String m) { 
        this.marca = m; }

    public boolean isLimpio() { 
        return limpio; }
    public void setLimpio(boolean l) { 
        this.limpio = l; }

    public void usar() {
        if (limpio) {
            limpio = false;
            System.out.println("\nHas salido a caminar con tus " + marca + " (" + tipo + "). Se han ensuciado");
        } else {
            System.out.println("\nTus zapatos " + marca + " ya estaban sucios");
        }
    }

    public void limpiarZapato() {
        if (!limpio) {
            limpio = true;
            System.out.println("\nHas lavado tus " + tipo + " de la marca " + marca );
        } else {
            System.out.println("\nYa están limpios");
        }
    }

    public static void main(String[] args) {
        Zapato miZapato = new Zapato("Casual", 41, "Adidas");
        Scanner leer = new Scanner(System.in);
        int opcion = 0;

        while (opcion != 3) {
            System.out.println("\nZAPATO (" + miZapato.getMarca() + ")");
            if (miZapato.isLimpio()) {
                System.out.println("Estado: Limpio");
            } else {
                System.out.println("Estado: Sucio");
            }
            System.out.println("1. Usar zapato");
            System.out.println("2. Limpiar zapato");
            System.out.println("3. Volver / Salir");
            System.out.print("Seleccione una accion: ");

            opcion = leer.nextInt();

            if (opcion == 1) {
                miZapato.usar();
            } else if (opcion == 2) {
                miZapato.limpiarZapato();
            } else if (opcion != 3) {
                System.out.println("Opcion invalida");
            }
        }
    }
}