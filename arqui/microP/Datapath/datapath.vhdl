library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Datapath is
    Port (
        CLK   : in  STD_LOGIC;

        -- Palabra de control
        W_UR  : in  STD_LOGIC;
        DC    : in  STD_LOGIC_VECTOR(2 downto 0);
        DA    : in  STD_LOGIC_VECTOR(2 downto 0);
        DB    : in  STD_LOGIC_VECTOR(2 downto 0);
        S     : in  STD_LOGIC_VECTOR(4 downto 0);
        Inm   : in  STD_LOGIC_VECTOR(7 downto 0);
        M1    : in  STD_LOGIC;
        M2    : in  STD_LOGIC;
        E3    : in  STD_LOGIC;  -- Señal de ejecución (habilita ER)

        -- Memoria de Datos (Harvard)
        Data_Read    : in  STD_LOGIC_VECTOR(7 downto 0);
        Data_Address : out STD_LOGIC_VECTOR(7 downto 0);
        Data_Write   : out STD_LOGIC_VECTOR(7 downto 0);

        -- Banderas
        C     : out STD_LOGIC;
        S_flag: out STD_LOGIC;
        V     : out STD_LOGIC;
        Z     : out STD_LOGIC
    );
end Datapath;

architecture Arq_DataP of Datapath is

    -- ============================================
    -- Componentes
    -- ============================================

    component Unit_Reg is
        Port (
            CLK  : in  STD_LOGIC;
            C    : in  STD_LOGIC_VECTOR(7 downto 0);
            DC   : in  STD_LOGIC_VECTOR(2 downto 0);
            DA   : in  STD_LOGIC_VECTOR(2 downto 0);
            DB   : in  STD_LOGIC_VECTOR(2 downto 0);
            L_OR : in  STD_LOGIC;
            A    : out STD_LOGIC_VECTOR(7 downto 0);
            B    : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component Unidad_Funcional is
        Port (
            A      : in  STD_LOGIC_VECTOR(7 downto 0);
            B      : in  STD_LOGIC_VECTOR(7 downto 0);
            S      : in  STD_LOGIC_VECTOR(4 downto 0);
            Ci     : in  STD_LOGIC;
            R      : out STD_LOGIC_VECTOR(7 downto 0);
            C      : out STD_LOGIC;
            V      : out STD_LOGIC;
            S_flag : out STD_LOGIC;
            Z      : out STD_LOGIC
        );
    end component;

    component Mux_2a1_8b is
        Port (
            I0 : in  STD_LOGIC_VECTOR(7 downto 0);
            I1 : in  STD_LOGIC_VECTOR(7 downto 0);
            S  : in  STD_LOGIC;
            Y  : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    -- ER (Mux 4a1 con habilitación)
    component ER is
        Port (
            C  : in  STD_LOGIC;
            S  : in  STD_LOGIC;
            V  : in  STD_LOGIC;
            Z  : in  STD_LOGIC;
            Sel: in  STD_LOGIC_VECTOR(1 downto 0);
            Op : in  STD_LOGIC_VECTOR(2 downto 0);  -- S(2:0) para saber si usa Ci
            E3 : in  STD_LOGIC;
            Ci : out STD_LOGIC
        );
    end component;

    -- ============================================
    -- Señales internas
    -- ============================================

    signal UR_A, UR_B    : STD_LOGIC_VECTOR(7 downto 0);
    signal MuxA_Out      : STD_LOGIC_VECTOR(7 downto 0);
    signal MuxB_Out      : STD_LOGIC_VECTOR(7 downto 0);
    signal UF_R          : STD_LOGIC_VECTOR(7 downto 0);
    signal Reg_Write     : STD_LOGIC_VECTOR(7 downto 0);
    signal Ci            : STD_LOGIC;
    signal C_int, S_int, V_int, Z_int : STD_LOGIC;

begin

    -- ============================================
    -- 1. Unidad de Registros (UR)
    -- ============================================
    UR_INST : Unit_Reg
        port map (
            CLK  => CLK,
            C    => Reg_Write,
            DC   => DC,
            DA   => DA,
            DB   => DB,
            L_OR => W_UR,
            A    => UR_A,
            B    => UR_B
        );

    -- ============================================
    -- 2. Mux entrada A (UR o Inm)
    -- ============================================
    MUX_A_INST : Mux_2a1_8b
        port map (
            I0 => UR_A,
            I1 => Inm,
            S  => M1,
            Y  => MuxA_Out
        );

    -- ============================================
    -- 3. Mux entrada B (UR o Data_Read)
    -- ============================================
    MUX_B_INST : Mux_2a1_8b
        port map (
            I0 => UR_B,
            I1 => Data_Read,
            S  => M2,
            Y  => MuxB_Out
        );

    -- ============================================
    -- 4. Unidad Funcional (ALU + Shifter)
    -- ============================================
    UF_INST : Unidad_Funcional
        port map (
            A      => MuxA_Out,
            B      => MuxB_Out,
            S      => S,
            Ci     => Ci,
            R      => UF_R,
            C      => C_int,
            V      => V_int,
            S_flag => S_int,
            Z      => Z_int
        );

    -- ============================================
    -- 5. Mux de salida (UF_R o Data_Read)
    -- ============================================
    MUX_OUT_INST : Mux_2a1_8b
        port map (
            I0 => UF_R,
            I1 => Data_Read,
            S  => M2,
            Y  => Reg_Write
        );

    -- ============================================
    -- 6. ER: Registro de Estado (Mux 4a1 con habilitación)
    --     Selecciona C/S/V/Z según S(1:0) cuando:
    --     - E3 = '1' (estamos en ejecución)
    --     - La operación usa Ci (S(2:0) = 000, 001, 010, 011)
    -- ============================================
    ER_INST : ER
        port map (
            C   => C_int,
            S   => S_int,
            V   => V_int,
            Z   => Z_int,
            Sel => S(1 downto 0),   -- Selector de bandera
            Op  => S(2 downto 0),   -- Tipo de operación
            E3  => E3,
            Ci  => Ci
        );

    -- ============================================
    -- 7. Salidas
    -- ============================================
    C      <= C_int;
    S_flag <= S_int;
    V      <= V_int;
    Z      <= Z_int;

    Data_Address <= MuxA_Out;  -- Dirección a memoria
    Data_Write   <= UR_B;      -- Datos a escribir en memoria

end Arq_DataP;