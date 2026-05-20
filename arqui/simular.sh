#!/bin/bash
echo "== 1. Analizando archivos =="
ghdl -a *.vhd

echo "== 2. Elaborando Testbench =="
ghdl -e comp

echo "== 3. Ejecutando simulación =="
ghdl -r comp --vcd=ondas.vcd
echo "¡Listo! Ya puedes abrir ondas.vcd"
