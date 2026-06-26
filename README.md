# Repo_C

## Descripción

Colección de ejercicios y proyectos en C (con ejemplos en C++, Java y Python) usados como banco de prácticas para programación estructurada y orientada a objetos.

## Contenido destacado

- `output/` — Ejecutables compilados (pueden eliminarse y recompilarse).
- `poo/` — Ejemplos orientados a objetos (C, C++, Java).
- `prog_estruct/` — Ejercicios estructurados en C y Python, incluyendo `batallaNaval`.

## Uso rápido

1) Compilar el archivo C activo (tarea de VS Code disponible):

   - Usa la tarea `C/C++: gcc build active file` desde el menú de tareas o el atajo de VS Code.

2) Compilar manualmente (ejemplo: Batalla Naval):

```bash
cd prog_estruct/batallaNaval
gcc -Wall -g batalla_main.c batalla_config.c batalla_tableros.c batalla_juego.c biblio_printconsola.c -o batalla_main
./batalla_main
```

3) Compilar cualquier otro programa en C:

```bash
cd ruta/al/directorio
gcc -Wall -g archivo.c -o archivo
./archivo
```

## Estructura del repositorio

- `poo/` — ejemplos y ejercicios orientados a objetos.
- `prog_estruct/` — ejercicios por tema y semanas (`arreglos`, `azar`, `batallaNaval`, `week1`, ...).
- `microP/`, `arqui/` — proyectos y materiales varios (VHDL, simulaciones, etc.).

## Buenas prácticas

- Cada ejercicio suele ser independiente: compílalo desde su carpeta.
- Borra binarios en `output/` si necesitas recompilar desde cero.

## Contribuir

Si quieres añadir ejercicios o mejoras, crea un branch, añade tus archivos y abre un PR. Incluye una breve descripción y pasos para reproducir.

## Comandos VHDL
GHDL:

- Analizar todos los archivos VHDL:

```bash
ghdl -a --std=08 *.vhd
```
- Elaborar (enlazar) el testbench / top:

```bash
ghdl -e <testbench_entity>
```
- Ejecutar y generar VCD:

```bash
ghdl -r <testbench_entity> --vcd=wave.vcd
```
- Ejecutar y generar FST (más eficiente para grandes trazas):

```bash
ghdl -r <testbench_entity> --fst=wave.fst
```
- Ejecutar con tiempo límite (ej. 100us):

```bash
ghdl -r <testbench_entity> --vcd=wave.vcd --stop-time=100us
```

ModelSim / Questa (flujo clásico):

- Crear librería de trabajo:

```bash
vlib work
```
- Compilar archivos VHDL (VHDL-2008):

```bash
vcom -2008 file.vhd
```
- Simular el testbench en modo consola y ejecutar hasta el final:

```bash
vsim work.<testbench_entity> -c -do "run -all; quit"
```

Xilinx Vivado (simulación con xelab/xsim):

- Elaborar y crear snapshot de simulación:

```bash
xelab <top_module_or_testbench> -s <snapshot_name>
```
- Ejecutar la simulación (GUI o modo batch):

```bash
xsim <snapshot_name> -R
```

Quartus / ModelSim-Altera:

- Usa los comandos `vcom` / `vsim` como en ModelSim, o ejecuta la simulación desde el flujo de Quartus (GUI o scripts de proyecto).

Visualización de ondas:

- Abrir VCD o FST con GTKWave:

```bash
gtkwave wave.vcd
gtkwave wave.fst
```

Sintetizar (flujo rápido y ejemplo básico con Yosys + GHDL frontend):

```bash
ghdl -a --std=08 *.vhd
ghdl -e top
yosys -p "ghdl --std=08 --workdir=work -f run; synth -top top; write_verilog top.synth.v"
```

Notas y consejos:

- Usa `--std=08` si tus fuentes usan características de VHDL-2008.
- GHDL acepta `--vcd` y `--fst` para generar trazas; `--fst` suele ser más rápido y eficiente.
- Para FPGA, sigue el flujo de síntesis y bitstream del vendor (Vivado para Xilinx, Quartus para Intel/Altera).
- Si necesitas un flujo concreto (ModelSim, Vivado, Quartus) puedo añadir scripts de ejemplo para `prog_estruct` o `arqui`.


