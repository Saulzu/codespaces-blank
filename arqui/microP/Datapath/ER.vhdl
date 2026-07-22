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

    -- Señales para detectar operaciones que usan Ci
    signal es_add, es_adc, es_sub, es_sbc : STD_LOGIC;

begin

    -- Detectar si la operación necesita Ci
    
    -- ADD: Op = "000"
    es_add <= (not Op(2)) and (not Op(1)) and (not Op(0));
    
    -- ADC: Op = "001"
    es_adc <= (not Op(2)) and (not Op(1)) and Op(0);
    
    -- SUB: Op = "010"
    es_sub <= (not Op(2)) and Op(1) and (not Op(0));
    
    -- SBC: Op = "011"
    es_sbc <= (not Op(2)) and Op(1) and Op(0);
    
    -- Usa_Ci = ADD or ADC or SUB or SBC
    Usa_Ci <= es_add or es_adc or es_sub or es_sbc;


    -- Mux 4a1 selecciona la bandera según Sel
 
    MUX_INST : Mux_4a1
        port map (
            I(0) => C,
            I(1) => S,
            I(2) => V,
            I(3) => Z,
            S    => Sel,
            Y    => Mux_Out
        );


    -- Ci solo se activa en E3 y si la operación lo necesita
  
    Ci <= Mux_Out and E3 and Usa_Ci;

end Arq_ER;