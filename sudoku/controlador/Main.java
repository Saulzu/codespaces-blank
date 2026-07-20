package sudoku.controlador;

import sudoku.modelo.Tablero;
import sudoku.modelo.persistencia.GestorArchivos;
import sudoku.vista.SudokuGUI;

import javax.swing.SwingUtilities;

public class Main {

    public static void main(String[] args) {
        // Aseguramos que la interfaz corra de forma segura en el hilo de eventos de Swing
        SwingUtilities.invokeLater(() -> {
            // 1. Instanciar el modelo principal
            Tablero tablero = new Tablero();
            
            // 3. Crear la Vista (GUI) pasándole el tablero y el gestor para que interactúe con ellos
            SudokuGUI gui = new SudokuGUI(tablero);

            // 4. Mostrar la pantalla principal
            gui.setVisible(true);
        });
    }
}