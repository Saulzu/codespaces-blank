package sudoku.modelo;

import sudoku.modelo.excepciones.SudokuException;

public class CeldaFija extends Celda{
    
    public CeldaFija(int valor) {
        super(valor);
    }
    
    @Override
    public boolean esModificable() {
        return false;
    }
    
    @Override
    public void setValor(int valor) throws SudokuException {
        throw new SudokuException("No se puede modificar una celda fija.");
    }
}
