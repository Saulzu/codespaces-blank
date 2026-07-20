package sudoku.modelo;

import sudoku.modelo.excepciones.SudokuException;

public class CeldaModificable extends Celda{
    public CeldaModificable() {
        super(0);
    }
    
    public CeldaModificable(int valor) {
        super(valor);
    }
    
    @Override
    public boolean esModificable() {
        return true;
    }
    
    @Override
    public void setValor(int valor) throws SudokuException {
        
        if (valor < 0 || valor > 9) {
            throw new SudokuException("El valor debe estar entre 0 y 9.");
        }
        
        this.valor = valor;
    }
    
    public void limpiar() {
        this.valor = 0;
    }
}
