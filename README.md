# Repo_C

## Descripción

Este repositorio contiene proyectos y ejercicios de programación en C, con ejemplos adicionales en C++ y Java, además de scripts en Python. El objetivo principal es servir como un banco de prácticas para programación estructurada y orientada a objetos.

## Estructura del repositorio

- `README.md` - Documento de descripción y guía básica.
- `output/` - Ejecutables compilados de varios programas en C.
- `poo/` - Ejemplos de programación orientada a objetos.
  - `c/` - Ejemplos en C con conceptos de programación estructurada.
  - `cplus2/` - Ejemplos en C++.
  - `java/` - Ejemplos en Java.
- `prog_estruct/` - Ejercicios de programación estructurada en C y Python.
  - `recomendacion.py` - Script en Python para recomendaciones.
  - `strint.c` - Programa en C para operaciones con cadenas y enteros.
  - `arreglos/` - Ejercicios con arreglos.
  - `azar/` - Ejercicios con elementos aleatorios o juegos sencillos.
  - `batallaNaval/` - Implementación del juego Batalla Naval en C.
  - `week1/`, `week2/`, `week3/`, `weekFinal/`, `weekOne/` - Colecciones de ejercicios organizados por semana.

## Batalla Naval

El módulo `prog_estruct/batallaNaval` contiene una implementación modular del juego Batalla Naval en C.

Archivos principales:

- `batalla_main.c` - Punto de entrada del juego.
- `batalla_config.c` / `batalla_config.h` - Configuración de juegos y constantes.
- `batalla_tableros.c` / `batalla_tableros.h` - Gestión de los tableros.
- `batalla_juego.c` / `batalla_juego.h` - Lógica principal del juego.
- `batalla_tipos.h` - Tipos y estructuras de datos.
- `biblio_printconsola.c` / `biblio_printconsola.h` - Utilidades para impresión en consola.

## Cómo compilar

### Compilar Batalla Naval

```bash
cd prog_estruct/batallaNaval
gcc -Wall -g batalla_main.c batalla_config.c batalla_tableros.c batalla_juego.c biblio_printconsola.c -o batalla_main
```

Ejecutar:

```bash
./batalla_main
```

### Compilar otros programas en C

Navega al directorio donde está el archivo fuente y usa `gcc`:

```bash
gcc -Wall -g archivo.c -o archivo
```

Ejemplo:

```bash
cd prog_estruct/arreglos
gcc -Wall -g arreglo_mayor.c -o arreglo_mayor
./arreglo_mayor
```

## Notas importantes

- Las carpetas `output/` contienen binarios compilados previamente que se pueden eliminar y volver a compilar si es necesario.
- Cada ejercicio o ejemplo generalmente es independiente y puede compilarse por separado.
- El propósito principal del repositorio es educativo.

## Licencia

No se especifica una licencia en este repositorio. Usa y modifica el código para fines educativos.
