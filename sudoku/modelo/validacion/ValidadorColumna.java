package sudoku.modelo.validacion;

import sudoku.modelo.Tablero;
import sudoku.modelo.excepciones.SudokuException;

public class ValidadorColumna implements Validador {
    
    @Override
    public void validar(Tablero tablero, int fila, int col, int valor) throws SudokuException {
        if (valor == 0) {
            return;
        }

        for (int f = 0; f < 9; f++) {
            if (f != fila && tablero.getValor(f, col) == valor) {
                throw new SudokuException("El número " + valor + " ya existe en esta columna.");
            }
        }
    }
}