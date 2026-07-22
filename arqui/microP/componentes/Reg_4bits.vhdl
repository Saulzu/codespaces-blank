library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_4bits is
    Port (
        CLK : in  STD_LOGIC;
        D   : in  STD_LOGIC_VECTOR(3 downto 0);
        Q   : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Reg_4bits;

architecture Arq_Reg_4bits of Reg_4bits is

    component FlipFlopD is
        Port (
            CLK : in  STD_LOGIC;
            D   : in  STD_LOGIC;
            Q   : out STD_LOGIC
        );
    end component;

begin

    FF0 : FlipFlopD port map (CLK => CLK, D => D(0), Q => Q(0));
    FF1 : FlipFlopD port map (CLK => CLK, D => D(1), Q => Q(1));
    FF2 : FlipFlopD port map (CLK => CLK, D => D(2), Q => Q(2));
    FF3 : FlipFlopD port map (CLK => CLK, D => D(3), Q => Q(3));

end Arq_Reg_4bits;