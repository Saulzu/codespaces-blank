library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity secuenciador is
    Port (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        E0  : out STD_LOGIC;
        E1  : out STD_LOGIC;
        E2  : out STD_LOGIC;
        E3  : out STD_LOGIC
    );
end secuenciador;

architecture Arq_sec of secuenciador is

    component Reg_4bits is
        Port (
            CLK : in  STD_LOGIC;
            D   : in  STD_LOGIC_VECTOR(3 downto 0);
            Q   : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal Q_reg : STD_LOGIC_VECTOR(3 downto 0);
    signal D_reg : STD_LOGIC_VECTOR(3 downto 0);

begin

    REG_ESTADO: Reg_4bits
        port map (
            CLK => clk,
            D   => D_reg,
            Q   => Q_reg
        );

    -- Lógica de próximo estado
    D_reg(0) <= rst;                                        -- Reset → E1
    D_reg(1) <= (Q_reg(0) or Q_reg(3)) and not rst;         -- E1 o E3 → E2
    D_reg(2) <= Q_reg(1) and not rst;                       -- E2 → E0
    D_reg(3) <= Q_reg(2) and not rst;                       -- E0 → E3

    -- Salidas
    E1 <= Q_reg(0);  -- Inicio/Reset
    E2 <= Q_reg(1);  -- Buscar instrucción
    E0 <= Q_reg(2);  -- Contar (PC+1)
    E3 <= Q_reg(3);  -- Ejecutar

end Arq_sec;