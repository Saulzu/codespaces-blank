-- COMPUERTA OR DE 2 ENTRADAS
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ComptOr is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end ComptOr;

architecture Ar_ComptOr of ComptOr is
begin
    Y <= A or B;
end Ar_ComptOr;
