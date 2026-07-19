package sudoku.modelo.validacion;

import sudoku.modelo.Tablero;
import sudoku.modelo.excepciones.SudokuException;

public interface Validador {
    void validar(Tablero tablero, int fila, int col, int valor) throws SudokuException;
}

// TODO: Crear ValidadorFila, ValidadorColumna y ValidadorRegion 
// implementando la interfaz Validador.