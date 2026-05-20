library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity comp is
  -- Un testbench siempre tiene la entidad vacía
end comp;

architecture Behavioral of comp is
  -- Señales locales para conectar al componente
  signal t_a : std_logic := '0';
  signal t_b : std_logic := '0';
  signal t_y : std_logic;
begin
  -- Instanciamos el componente que vamos a probar
  uut : entity work.mi_componente
    port map
    (
      a => t_a,
      b => t_b,
      y => t_y
    );

  -- Proceso de estímulos
  stim_proc : process
  begin
    -- Caso 00
    t_a <= '0';
    t_b <= '0';
    wait for 10 ns;
    -- Caso 01
    t_a <= '0';
    t_b <= '1';
    wait for 10 ns;
    -- Caso 10
    t_a <= '1';
    t_b <= '0';
    wait for 10 ns;
    -- Caso 11
    t_a <= '1';
    t_b <= '1';
    wait for 10 ns;

    wait; -- Detiene la simulación
  end process;
end Behavioral;
