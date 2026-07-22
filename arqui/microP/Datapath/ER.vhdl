library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ER is
    Port (
        C  : in  STD_LOGIC;
        S  : in  STD_LOGIC;
        V  : in  STD_LOGIC;
        Z  : in  STD_LOGIC;
        Sel: in  STD_LOGIC_VECTOR(1 downto 0);  -- S(1:0) de la instrucción
        Op : in  STD_LOGIC_VECTOR(2 downto 0);  -- S(2:0) para saber si usa Ci
        E3 : in  STD_LOGIC;                     -- Señal de ejecución
        Ci : out STD_LOGIC
    );
end ER;

architecture Arq_ER of ER is

    component Mux_4a1 is
        Port (
            I : in  STD_LOGIC_VECTOR(3 downto 0);
            S : in  STD_LOGIC_VECTOR(1 downto 0);
            Y : out STD_LOGIC
        );
    end component;

    signal Mux_Out : STD_LOGIC;
    signal Usa_Ci  : STD_LOGIC;

begin

    -- ============================================
    -- Detectar si la operación necesita Ci
    -- S(2:0):
    --   000 = ADD  (suma)
    --   001 = ADC  (suma con acarreo)
    --   010 = SUB  (resta)
    --   011 = SBC  (resta con acarreo)
    -- ============================================
    Usa_Ci <= '1' when (Op = "000" or Op = "001" or Op = "010" or Op = "011") else '0';

    -- ============================================
    -- Mux 4a1 selecciona la bandera según Sel
    -- ============================================
    MUX_INST : Mux_4a1
        port map (
            I(0) => C,
            I(1) => S,
            I(2) => V,
            I(3) => Z,
            S    => Sel,
            Y    => Mux_Out
        );

    -- ============================================
    -- Ci solo se activa en E3 y si la operación lo necesita
    -- ============================================
    Ci <= Mux_Out when (E3 = '1' and Usa_Ci = '1') else '0';

end Arq_ER;