library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FlipFlopD is
    Port (
        CLK : in  STD_LOGIC; -- Señal de Reloj
        D   : in  STD_LOGIC; -- Entrada de datos
        Q   : out STD_LOGIC  -- Salida del Flip-Flop
    );
end FlipFlopD;

architecture Arq_FlipFlopD of FlipFlopD is
begin

    process(CLK)
    begin
        -- Detecta el flanco de subida del reloj
        if rising_edge(CLK) then
            Q <= D; -- El dato de la entrada se transfiere a la salida
        end if;
    end process;

end Arq_FlipFlopD;