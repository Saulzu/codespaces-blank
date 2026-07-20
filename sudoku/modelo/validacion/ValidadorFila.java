package sudoku.modelo.validacion;

import sudoku.modelo.Tablero;
import sudoku.modelo.excepciones.SudokuException;

public class ValidadorFila implements Validador{

    @Override
    public void validar(Tablero tablero, int fila, int col, int valor) throws SudokuException {
       
        if (valor == 0) {
            return;
        }
        for (int c = 0; c < 9; c++) {
            if (c != col && tablero.getValor(fila, c) == valor) {
                throw new SudokuException("El número " + valor + " ya existe en esta fila.");
            }
        }
    }
}
