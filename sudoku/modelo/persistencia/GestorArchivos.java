package sudoku.modelo.persistencia;

import sudoku.modelo.Tablero;
import sudoku.modelo.Celda;
import sudoku.modelo.CeldaFija;
import sudoku.modelo.CeldaModificable;
import java.io.*;

public class GestorArchivos implements Persistencia {

    @Override
    public void guardar(Tablero tablero, String ruta) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(ruta))) {
            for (int i = 0; i < 9; i++) {
                StringBuilder lineaValores = new StringBuilder();
                StringBuilder lineaTipos = new StringBuilder();

                for (int j = 0; j < 9; j++) {
                    int valor = tablero.getValor(i, j);
                    boolean esFija = tablero.esCeldaFija(i, j);

                    lineaValores.append(valor).append(" ");
                    lineaTipos.append(esFija ? "F " : "M ");
                }

                // Guardamos una línea de valores y luego una línea con los tipos (F/M)
                writer.write(lineaValores.toString().trim());
                writer.newLine();
                writer.write(lineaTipos.toString().trim());
                writer.newLine();
            }
        }
    }

    @Override
    public void cargar(Tablero tablero, String ruta) throws IOException {
        try (BufferedReader reader = new BufferedReader(new FileReader(ruta))) {
            for (int i = 0; i < 9; i++) {
                String lineaValores = reader.readLine();
                String lineaTipos = reader.readLine();

                if (lineaValores == null || lineaTipos == null) {
                    throw new IOException("El archivo de guardado está incompleto.");
                }

                String[] valores = lineaValores.trim().split("\\s+");
                String[] tipos = lineaTipos.trim().split("\\s+");

                for (int j = 0; j < 9; j++) {
                    int val = Integer.parseInt(valores[j]);
                    boolean esFija = tipos[j].equals("F");

                    Celda nuevaCelda;
                    if (esFija) {
                        nuevaCelda = new CeldaFija(val);
                    } else {
                        nuevaCelda = new CeldaModificable(val);
                    }

                    // Actualizamos la casilla del tablero actual
                    tablero.setCelda(i, j, nuevaCelda);
                }
            }
        }
    }
}

