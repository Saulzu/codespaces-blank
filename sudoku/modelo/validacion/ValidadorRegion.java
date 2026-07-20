package sudoku.modelo.validacion;

import sudoku.modelo.Tablero;
import sudoku.modelo.excepciones.SudokuException;

public class ValidadorRegion implements Validador {
    @Override
    public void validar(Tablero tablero, int fila, int col, int valor) throws SudokuException {
        if (valor == 0) {
            return;
        }

        int inicioFila = (fila / 3) * 3;
        int inicioCol = (col / 3) * 3;

        for (int f = inicioFila; f < inicioFila + 3; f++) {
            for (int c = inicioCol; c < inicioCol + 3; c++) {
                if ((f != fila || c != col) && tablero.getValor(f, c) == valor) {
                    throw new SudokuException("El número " + valor + " ya existe en esta región de 3x3.");
                }
            }
        }
    }
}
