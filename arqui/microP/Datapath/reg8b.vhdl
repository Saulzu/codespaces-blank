library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg8b is
    Port (
        CLK : in  STD_LOGIC;                       -- Señal de reloj (flanco de subida)
        W   : in  STD_LOGIC;                       -- Habilitación de escritura (1=escribe, 0=retiene)
        D   : in  STD_LOGIC_VECTOR(7 downto 0);   -- Datos de entrada (8 bits)
        Q   : out STD_LOGIC_VECTOR(7 downto 0)    -- Datos almacenados en salida (8 bits)
    );
end Reg8b;

architecture Arq_Reg8b of Reg8b is

    component FlipFlopD is
        Port ( 
            clk : in  STD_LOGIC;  -- Reloj
            D   : in  STD_LOGIC;  -- Entrada de datos (1 bit)
            Q   : out STD_LOGIC   -- Salida del flip-flop
        );
    end component;

begin

    REG_ESTRUCTURAL: for i in 0 to 7 generate
        Bit_x: FlipFlopD port map (
            clk => CLK, 
            D   => D(i), 
            Q   => Q(i)
        );
    end generate REG_ESTRUCTURAL;

end Arq_Reg8b;