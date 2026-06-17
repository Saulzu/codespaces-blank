-- MUX 8 A 1
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux8a1_8b is
    Port (
        I0, I1, I2, I3, I4, I5, I6, I7 : in STD_LOGIC_VECTOR(7 downto 0);
        S : in  STD_LOGIC_VECTOR(2 downto 0);
        Y : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Mux8a1_8b;

architecture Ar_Mux8a1_8b of Mux8a1_8b is
begin
    with S select
        Y <= I0 when "000",
             I1 when "001",
             I2 when "010",
             I3 when "011",
             I4 when "100",
             I5 when "101",
             I6 when "110",
             I7 when "111",
             (others => '0') when others;
end Ar_Mux8a1_8b;
