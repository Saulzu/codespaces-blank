package sudoku.modelo.persistencia;

import sudoku.modelo.Tablero;
import java.io.IOException;

public interface Persistencia {
    void guardar(Tablero tablero, String ruta) throws IOException;
    void cargar(Tablero tablero, String ruta) throws IOException;
}

// TODO: Crear GestorArchivos que implemente Persistencia para leer/escribir TXT.