package sudoku.modelo;

import sudoku.modelo.excepciones.SudokuException;

public abstract class Celda {
    protected int valor;
    // TODO: Crear constructor base y el getter getValor()
    public abstract void setValor(int valor) throws SudokuException;
    public abstract boolean isFija();
}

// TODO: Crear clase CeldaFija que herede de Celda. 
// Su método setValor debe lanzar SudokuException.

// TODO: Crear clase CeldaModificable que herede de Celda. 
// Su método setValor actualiza el atributo 'valor'.