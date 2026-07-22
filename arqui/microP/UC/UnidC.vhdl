library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UControl is
    Port (
        CLK        : in  STD_LOGIC;
        E0         : in  STD_LOGIC;  -- Contar (PC+1)
        E1         : in  STD_LOGIC;  -- Inicio/Reset
        E2         : in  STD_LOGIC;  -- Buscar instrucción
        E3         : in  STD_LOGIC;  -- Ejecutar

        Instruction : in  STD_LOGIC_VECTOR(25 downto 0);

        PC_Out     : out STD_LOGIC_VECTOR(15 downto 0);
        IR_Out     : out STD_LOGIC_VECTOR(25 downto 0);
        MW_Output  : out STD_LOGIC
    );
end UControl;

architecture Arq_UnidadC of UControl is

    component PC is
        Port (
            CLK : in  STD_LOGIC;
            W   : in  STD_LOGIC;
            C   : in  STD_LOGIC_VECTOR(15 downto 0);
            Q   : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component IR is
        Port (
            CLK : in  STD_LOGIC;
            W   : in  STD_LOGIC;
            D   : in  STD_LOGIC_VECTOR(25 downto 0);
            Q   : out STD_LOGIC_VECTOR(25 downto 0)
        );
    end component;

    signal PC_Load   : STD_LOGIC;
    signal IR_Load   : STD_LOGIC;
    signal PC_Next   : STD_LOGIC_VECTOR(15 downto 0);
    signal PC_Current: STD_LOGIC_VECTOR(15 downto 0);
    signal IR_Current: STD_LOGIC_VECTOR(25 downto 0);

begin

    -- ============================================
    -- Control de carga
    -- ============================================
    PC_Load <= E0;               -- Avanzar PC en E0
    IR_Load <= E2;               -- Cargar IR en E2

    -- ============================================
    -- PC (incrementa automáticamente o carga)
    -- ============================================
    PC_INST : PC
        port map (
            CLK => CLK,
            W   => PC_Load,
            C   => (others => '0'),  -- No se usa salto aquí (se hace en Logica_Saltos)
            Q   => PC_Current
        );

    -- ============================================
    -- IR (carga instrucción en E2)
    -- ============================================
    IR_INST : IR
        port map (
            CLK => CLK,
            W   => IR_Load,
            D   => Instruction,
            Q   => IR_Current
        );

    -- ============================================
    -- Salidas
    -- ============================================
    PC_Out    <= PC_Current;
    IR_Out    <= IR_Current;
    MW_Output <= Instruction(10);  -- MW directo desde la instrucción

end Arq_UnidadC;