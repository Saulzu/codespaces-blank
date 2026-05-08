# Repo_C

## Overview

This repository contains C programming projects and exercises, with a main focus on a console-based Battleship game (`Batalla Naval`) and additional structured programming practice examples. It also includes object-oriented programming examples in C++ and Java, as well as Python scripts.

The Battleship game is implemented with modular C source files that separate configuration, board setup, game logic, and console output handling.

## Repository Structure

- `README.md` - This file.
- `output/` - Directory containing compiled executables from various C programs.
- `poo/` - Object-oriented programming examples.
  - `cplus2/` - C++ code examples.
  - `java/` - Java code examples.
- `prog_estruct/` - Structured programming exercises in C and Python, organized by topic and week.
  - `recomendacion.py` - Python script for recommendations.
  - `strint.c` - C program for string-integer operations.
  - `arreglos/` - Array-related exercises.
    - `arreglo_mayor.c` - Find largest in array.
    - `binaria.c` - Binary search.
    - `dist_num.c` - Number distribution.
    - `entero.c` - Integer operations.
  - `azar/` - Random/exercise files.
    - `ejersmn4.c` - Exercise 4.
  - `batallaNaval/` - Battleship game implementation.
    - `batalla_config.c` / `batalla_config.h` - Configuration.
    - `batalla_juego.c` / `batalla_juego.h` - Game logic.
    - `batalla_main.c` - Main entry point.
    - `batalla_tableros.c` / `batalla_tableros.h` - Board management.
    - `batalla_tipos.h` - Type definitions.
    - `biblio_printconsola.c` / `biblio_printconsola.h` - Console utilities.
    - `output/` - Compiled outputs.
  - `week1/` - Week 1 exercises.
  - `week2/` - Week 2 exercises.
  - `week3/` - Week 3 exercises.
  - `weekFinal/` - Final week exercises.
  - `weekOne/` - Additional week 1 exercises.

## Build Instructions

To compile the Battleship game on Linux using `gcc`:

```bash
cd prog_estruct/batallaNaval
gcc -Wall -g batalla_main.c batalla_config.c batalla_tableros.c batalla_juego.c biblio_printconsola.c -o batalla_main
```

Then run the executable:

```bash
./batalla_main
```

For other C programs, navigate to their directories and compile similarly, e.g.:

```bash
gcc -Wall -g program.c -o program
```

## Notes

- The repository is designed for learning and practicing programming concepts in C, C++, Java, and Python.
- The `prog_estruct` directory contains standalone exercise files and folders that can be compiled separately.
- The `output` directories contain pre-compiled executables; rebuild as needed.
- If binaries already exist, they may be previously built and can be safely removed before rebuilding.

## License

No license is specified in this repository. Use and modify the code for educational purposes.
