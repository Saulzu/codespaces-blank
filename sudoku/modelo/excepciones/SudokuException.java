package sudoku.modelo.excepciones;

public class SudokuException extends Exception {
    public SudokuException(String mensaje) {
        super(mensaje);
    }
}