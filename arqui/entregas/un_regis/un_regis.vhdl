-- UNIDAD DE REGISTROS
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Unit_Reg is
    Port (
        CLK      : in  STD_LOGIC;
        C        : in  STD_LOGIC_VECTOR(7 downto 0);
        DC       : in  STD_LOGIC_VECTOR(2 downto 0);
        DA       : in  STD_LOGIC_VECTOR(2 downto 0);
        DB       : in  STD_LOGIC_VECTOR(2 downto 0);
        L_OR : in  STD_LOGIC;
        A        : out STD_LOGIC_VECTOR(7 downto 0);
        B        : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Unit_Reg;

architecture Ar_UnitReg of Unit_Reg is
    -- Componentes
    component Deco3a8 is
        Port ( S: in STD_LOGIC_VECTOR(2 downto 0); Y : out STD_LOGIC_VECTOR(7 downto 0) );
    end component;

    component ComptOr is
        Port ( A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC );
    end component;

    component Reg8b is
        Port ( CLK : in STD_LOGIC; W : in STD_LOGIC; D : in STD_LOGIC_VECTOR(7 downto 0); Q : out STD_LOGIC_VECTOR(7 downto 0) );
    end component;

    component Mux8a1_8b is
        Port ( I0, I1, I2, I3, I4, I5, I6, I7 : in STD_LOGIC_VECTOR(7 downto 0); S : in STD_LOGIC_VECTOR(2 downto 0); Y : out STD_LOGIC_VECTOR(7 downto 0) );
    end component;

    -- Cables
    signal deco_out : STD_LOGIC_VECTOR(7 downto 0); 
    signal w        : STD_LOGIC_VECTOR(7 downto 0); 

    signal r0, r1, r2, r3, r4, r5, r6, r7 : STD_LOGIC_VECTOR(7 downto 0);
begin
    DECO_INST : Deco3a8 port map (S => DC, Y => deco_out);

    OR_0 : ComptOr port map (A => deco_out(0), B => L_OR, Y => w(0));
    OR_1 : ComptOr port map (A => deco_out(1), B => L_OR, Y => w(1));
    OR_2 : ComptOr port map (A => deco_out(2), B => L_OR, Y => w(2));
    OR_3 : ComptOr port map (A => deco_out(3), B => L_OR, Y => w(3));
    OR_4 : ComptOr port map (A => deco_out(4), B => L_OR, Y => w(4));
    OR_5 : ComptOr port map (A => deco_out(5), B => L_OR, Y => w(5));
    OR_6 : ComptOr port map (A => deco_out(6), B => L_OR, Y => w(6));
    OR_7 : ComptOr port map (A => deco_out(7), B => L_OR, Y => w(7));

    REG_R0 : Reg8b port map (CLK => CLK, W => w(0), D => C, Q => r0);
    REG_R1 : Reg8b port map (CLK => CLK, W => w(1), D => C, Q => r1);
    REG_R2 : Reg8b port map (CLK => CLK, W => w(2), D => C, Q => r2);
    REG_R3 : Reg8b port map (CLK => CLK, W => w(3), D => C, Q => r3);
    REG_R4 : Reg8b port map (CLK => CLK, W => w(4), D => C, Q => r4);
    REG_R5 : Reg8b port map (CLK => CLK, W => w(5), D => C, Q => r5);
    REG_R6 : Reg8b port map (CLK => CLK, W => w(6), D => C, Q => r6);
    REG_R7 : Reg8b port map (CLK => CLK, W => w(7), D => C, Q => r7);

    MUX_A_INST : Mux8a1_8b port map (
        I0 => r0, I1 => r1, I2 => r2, I3 => r3,
        I4 => r4, I5 => r5, I6 => r6, I7 => r7,
        S => DA, Y => A
    );

    MUX_B_INST : Mux8a1_8b port map (
        I0 => r0, I1 => r1, I2 => r2, I3 => r3,
        I4 => r4, I5 => r5, I6 => r6, I7 => r7,
        S => DB, Y => B
    );

end Ar_UnitReg;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 