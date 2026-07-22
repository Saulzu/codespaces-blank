library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MicroP is
    Port (
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;

        -- Memoria de Código 
        Instruction_Bus : in  STD_LOGIC_VECTOR(25 downto 0);
        PC_Address      : out STD_LOGIC_VECTOR(15 downto 0);

        -- Memoria de Datos
        Data_Read    : in  STD_LOGIC_VECTOR(7 downto 0);
        Data_Address : out STD_LOGIC_VECTOR(7 downto 0);
        Data_Write   : out STD_LOGIC_VECTOR(7 downto 0);
        Mem_Write    : out STD_LOGIC
    );
end MicroP;

architecture Arq_Microp of MicroP is

    -- Señales internas
    signal IR_Internal : STD_LOGIC_VECTOR(25 downto 0);
    signal PC_Internal : STD_LOGIC_VECTOR(15 downto 0);
    signal C_out, S_out, V_out, Z_out : STD_LOGIC;
    signal Jump_Signal : STD_LOGIC;

    -- Señales del Secuenciador
    signal E0, E1, E2, E3 : STD_LOGIC;

    -- Señales de control extraídas del IR
    signal W_UR, MW, M1, M2 : STD_LOGIC;
    signal DC, DA, DB : STD_LOGIC_VECTOR(2 downto 0);
    signal S : STD_LOGIC_VECTOR(4 downto 0);
    signal Inm : STD_LOGIC_VECTOR(7 downto 0);

    -- Señales del Datapath
    signal Data_Addr_Internal : STD_LOGIC_VECTOR(7 downto 0);
    signal Data_Write_Internal : STD_LOGIC_VECTOR(7 downto 0);

begin

    DC  <= IR_Internal(25 downto 23);
    DA  <= IR_Internal(22 downto 20);
    DB  <= IR_Internal(19 downto 17);
    S   <= IR_Internal(16 downto 12);
    W_UR<= IR_Internal(11);
    MW  <= IR_Internal(10);
    M1  <= IR_Internal(9);
    M2  <= IR_Internal(8);
    Inm <= IR_Internal(7 downto 0);

    SECUENCIADOR_INST : entity work.secuenciador
        port map (
            clk => CLK,
            rst => RST,
            E0  => E0,
            E1  => E1,
            E2  => E2,
            E3  => E3
        );

    UC_INST : entity work.UControl
        port map (
            CLK        => CLK,
            E0         => E0,
            E1         => E1,
            E2         => E2,
            E3         => E3,
            Instruction => Instruction_Bus,
            PC_Out     => PC_Internal,
            IR_Out     => IR_Internal,
            MW_Output  => Mem_Write
        );

    DATAPATH_INST : entity work.Datapath
        port map (
            CLK          => CLK,
            W_UR         => W_UR,
            DC           => DC,
            DA           => DA,
            DB           => DB,
            S            => S,
            Inm          => Inm,
            M1           => M1,
            M2           => M2,
            E3           => E3,
            Data_Read    => Data_Read,
            Data_Address => Data_Addr_Internal,
            Data_Write   => Data_Write_Internal,
            C            => C_out,
            S_flag       => S_out,
            V            => V_out,
            Z            => Z_out
        );

    JUMP_LOGIC_INST : entity work.LogicSaltos
        port map (
            S4         => S(4),
            S3         => S(3),
            S2         => S(2),
            S1         => S(1),
            S0         => S(0),
            C_flag     => C_out,
            S_flag     => S_out,
            V_flag     => V_out,
            Z_flag     => Z_out,
            Jump_Taken => Jump_Signal
        );

    PC_Address   <= PC_Internal;
    Data_Address <= Data_Addr_Internal;
    Data_Write   <= Data_Write_Internal;

end Arq_Microp;