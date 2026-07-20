package sudoku.modelo;

import sudoku.modelo.excepciones.SudokuException;

public abstract class Celda {
    protected int valor;

    public Celda(int valor) {
        this.valor = valor;
    }
    
    public int getValor() {
        return valor;
    }
    
    public abstract void setValor(int valor) throws SudokuException;
    public abstract boolean esModificable();
}
