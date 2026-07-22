library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Datapath is
    Port (
        CLK   : in  STD_LOGIC;

        W_UR  : in  STD_LOGIC;
        DC    : in  STD_LOGIC_VECTOR(2 downto 0);
        DA    : in  STD_LOGIC_VECTOR(2 downto 0);
        DB    : in  STD_LOGIC_VECTOR(2 downto 0);
        S     : in  STD_LOGIC_VECTOR(4 downto 0);
        Inm   : in  STD_LOGIC_VECTOR(7 downto 0);
        M1    : in  STD_LOGIC;
        M2    : in  STD_LOGIC;
        E3    : in  STD_LOGIC;  

        -- Memoria de Datos 
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

    signal UR_A, UR_B    : STD_LOGIC_VECTOR(7 downto 0);
    signal MuxA_Out      : STD_LOGIC_VECTOR(7 downto 0);
    signal MuxB_Out      : STD_LOGIC_VECTOR(7 downto 0);
    signal UF_R          : STD_LOGIC_VECTOR(7 downto 0);
    signal Reg_Write     : STD_LOGIC_VECTOR(7 downto 0);
    signal Ci            : STD_LOGIC;
    signal C_int, S_int, V_int, Z_int : STD_LOGIC;

begin

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

    -- Mux entrada A (UR o Inm)
    MUX_A_INST : Mux_2a1_8b
        port map (
            I0 => UR_A,
            I1 => Inm,
            S  => M1,
            Y  => MuxA_Out
        );

    -- Mux entrada B (UR o Data_Read)
    MUX_B_INST : Mux_2a1_8b
        port map (
            I0 => UR_B,
            I1 => Data_Read,
            S  => M2,
            Y  => MuxB_Out
        );

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

    -- Mux de salida (UF_R o Data_Read)
    MUX_OUT_INST : Mux_2a1_8b
        port map (
            I0 => UF_R,
            I1 => Data_Read,
            S  => M2,
            Y  => Reg_Write
        );

    -- ER: Registro de Estado (Mux 4a1 con habilitación)
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

    -- Salidas
    C      <= C_int;
    S_flag <= S_int;
    V      <= V_int;
    Z      <= Z_int;

    Data_Address <= MuxA_Out;  -- Dirección a memoria
    Data_Write   <= UR_B;      -- Datos a escribir en memoria

end Arq_DataP;