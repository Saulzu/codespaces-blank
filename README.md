# Repo_C

## Overview

This repository contains C programming projects and exercises, with a main focus on a console-based Battleship game (`Batalla Naval`) and additional structured programming practice examples.

The Battleship game is implemented with modular C source files that separate configuration, board setup, game logic, and console output handling.

## Repository Structure

- `batalla_main.c` - Entry point for the Battleship game.
- `batalla_config.c` / `batalla_config.h` - Reads board and player configuration.
- `batalla_tableros.c` / `batalla_tableros.h` - Manages board creation, memory allocation, and ship placement.
- `batalla_juego.c` / `batalla_juego.h` - Contains the main gameplay loop, shot validation, board rendering, and game state updates.
- `batalla_tipos.h` - Defines shared data structures and enumerations for the game.
- `biblio_printconsola.c` / `biblio_printconsola.h` - Console utility functions for cursor control and colored text output.
- `batallaNaval/` - Additional output data and runtime artifacts related to the Battleship project.
- `prog_estruct/` - Structured programming exercises in C and Python, organized by topic and week.

## Build Instructions

To compile the Battleship game on Linux using `gcc`:

```bash
gcc -Wall -g batalla_main.c batalla_config.c batalla_tableros.c batalla_juego.c biblio_printconsola.c -o batalla_main
```

Then run the executable:

```bash
./batalla_main
```

## Notes

- The repository is designed for learning and practicing C programming concepts such as dynamic memory, structs, file organization, and console-based user interaction.
- The `prog_estruct` directory contains standalone exercise files and folders that can be compiled separately.
- If the `batalla_main` binary already exists in the repo, it may be a previously built executable and can be safely ignored or removed before rebuilding.

## License

No license is specified in this repository. Use and modify the code for educational purposes.
