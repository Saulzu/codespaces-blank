library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port (
        CLK : in  STD_LOGIC;
        W   : in  STD_LOGIC;                     -- Habilitación de escritura general
        C   : in  STD_LOGIC_VECTOR(15 downto 0); -- Entrada para carga en paralelo
        Q   : out STD_LOGIC_VECTOR(15 downto 0)  -- Salida actual del PC
    );
end PC;

architecture Arq_PC of PC is

    component FlipFlopD is
        Port (
            CLK : in  STD_LOGIC;
            D   : in  STD_LOGIC;
            Q   : out STD_LOGIC
        );
    end component;

    -- Señales de estado actual del contador
    signal q_reg : STD_LOGIC_VECTOR(15 downto 0);
    
    -- Entrada de datos finales listos para ir a cada Flip-Flop D
    signal d_reg : STD_LOGIC_VECTOR(15 downto 0);
    
    -- Líneas del bus de acarreo de incremento (ANDs en cascada)
    signal carry : STD_LOGIC_VECTOR(15 downto 0);
    
    -- Valor que resultaría del incremento bit a bit
    signal inc   : STD_LOGIC_VECTOR(15 downto 0);

    -- Señal de control invertida para los muxes de carga/incremento
    signal W_n   : STD_LOGIC;

begin

    W_n <= not W;
    Q   <= q_reg; -- Conexión directa a la salida física

    -- ========================================================
    -- 1. LÓGICA DE INCREMENTO COMBINACIONAL PURA (SIN SUMADOR)
    -- ========================================================
    -- El bit 0 siempre cambia si el contador está activo
    inc(0)   <= q_reg(0) xor '1';
    carry(0) <= q_reg(0);

    -- Propagación del acarreo mediante compuertas lógicas en cascada
    inc(1)   <= q_reg(1) xor carry(0);
    carry(1) <= carry(0) and q_reg(1);

    inc(2)   <= q_reg(2) xor carry(1);
    carry(2) <= carry(1) and q_reg(2);

    inc(3)   <= q_reg(3) xor carry(2);
    carry(3) <= carry(2) and q_reg(3);

    inc(4)   <= q_reg(4) xor carry(3);
    carry(4) <= carry(3) and q_reg(4);

    inc(5)   <= q_reg(5) xor carry(4);
    carry(5) <= carry(4) and q_reg(5);

    inc(6)   <= q_reg(6) xor carry(5);
    carry(6) <= carry(5) and q_reg(6);

    inc(7)   <= q_reg(7) xor carry(6);
    carry(7) <= carry(6) and q_reg(7);

    inc(8)   <= q_reg(8) xor carry(7);
    carry(8) <= carry(7) and q_reg(8);

    inc(9)   <= q_reg(9) xor carry(8);
    carry(9) <= carry(8) and q_reg(9);

    inc(10)  <= q_reg(10) xor carry(9);
    carry(10)<= carry(9) and q_reg(10);

    inc(11)  <= q_reg(11) xor carry(10);
    carry(11)<= carry(10) and q_reg(11);

    inc(12)  <= q_reg(12) xor carry(11);
    carry(12)<= carry(11) and q_reg(12);

    inc(13)  <= q_reg(13) xor carry(12);
    carry(13)<= carry(12) and q_reg(13);

    inc(14)  <= q_reg(14) xor carry(13);
    carry(14)<= carry(13) and q_reg(14);

    inc(15)  <= q_reg(15) xor carry(14);
    -- El último acarreo carry(15) no se necesita mapear ya que es el final del bus.

    -- ========================================================
    -- 2. SELECCIÓN DE ENTRADA: ¿CARGA EN PARALELO O INCREMENTO?
    -- ========================================================
    -- Si W = '1' -> Se guardan los datos externos de C (Carga paralela)
    -- Si W = '0' -> Se mantiene el circuito en modo contador interno (Incrementa continuamente)
    d_reg <= (C and (15 downto 0 => W)) or (inc and (15 downto 0 => W_n));

    -- ========================================================
    -- 3. ARRASTRADO ESTRUCTURAL DE LOS 16 FLIP-FLOPS D
    -- ========================================================
    FF_PC0  : FlipFlopD port map (CLK => CLK, D => d_reg(0),  Q => q_reg(0));
    FF_PC1  : FlipFlopD port map (CLK => CLK, D => d_reg(1),  Q => q_reg(1));
    FF_PC2  : FlipFlopD port map (CLK => CLK, D => d_reg(2),  Q => q_reg(2));
    FF_PC3  : FlipFlopD port map (CLK => CLK, D => d_reg(3),  Q => q_reg(3));
    FF_PC4  : FlipFlopD port map (CLK => CLK, D => d_reg(4),  Q => q_reg(4));
    FF_PC5  : FlipFlopD port map (CLK => CLK, D => d_reg(5),  Q => q_reg(5));
    FF_PC6  : FlipFlopD port map (CLK => CLK, D => d_reg(6),  Q => q_reg(6));
    FF_PC7  : FlipFlopD port map (CLK => CLK, D => d_reg(7),  Q => q_reg(7));
    FF_PC8  : FlipFlopD port map (CLK => CLK, D => d_reg(8),  Q => q_reg(8));
    FF_PC9  : FlipFlopD port map (CLK => CLK, D => d_reg(9),  Q => q_reg(9));
    FF_PC10 : FlipFlopD port map (CLK => CLK, D => d_reg(10), Q => q_reg(10));
    FF_PC11 : FlipFlopD port map (CLK => CLK, D => d_reg(11), Q => q_reg(11));
    FF_PC12 : FlipFlopD port map (CLK => CLK, D => d_reg(12), Q => q_reg(12));
    FF_PC13 : FlipFlopD port map (CLK => CLK, D => d_reg(13), Q => q_reg(13));
    FF_PC14 : FlipFlopD port map (CLK => CLK, D => d_reg(14), Q => q_reg(14));
    FF_PC15 : FlipFlopD port map (CLK => CLK, D => d_reg(15), Q => q_reg(15));

end Arq_PC;