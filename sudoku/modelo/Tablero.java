package sudoku.modelo;

import sudoku.modelo.excepciones.SudokuException;
import sudoku.modelo.validacion.*;
import sudoku.modelo.persistencia.*;
import java.util.ArrayList;
import java.util.List;

public class Tablero {
    private Celda[][] cuadricula;
    private List<Validador> validadores;
    private Persistencia persistencia;

    public Tablero() {
        cuadricula = new Celda[9][9];
        validadores = new ArrayList<>();
        persistencia = new GestorArchivos(); // TODO: Requiere GestorArchivos terminado
        
        // TODO: Agregar a la lista los 3 validadores.
        
        for(int i=0; i<9; i++){
            for(int j=0; j<9; j++){
                cuadricula[i][j] = new CeldaModificable(0); // TODO: Requiere CeldaModificable
            }
        }
    }

    public void ingresarValor(int fila, int col, int valor) throws SudokuException {
        // TODO: Si valor != 0, iterar lista de validadores.
        // Si es válido, asignar el valor a la celda correspondiente.
    }

    public int getValor(int fila, int col) {
        return cuadricula[fila][col].getValor();
    }
    
    public boolean esCeldaFija(int fila, int col) {
        return cuadricula[fila][col].isFija();
    }
    
    public void setCelda(int fila, int col, Celda celda) {
        cuadricula[fila][col] = celda;
    }

    public void guardarPartida(String ruta) throws Exception {
        persistencia.guardar(this, ruta);
    }

    public void cargarPartida(String ruta) throws Exception {
        persistencia.cargar(this, ruta);
    }
}