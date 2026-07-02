library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sec is
    Port (
        CLK : in  STD_LOGIC;
        InA : in  STD_LOGIC; -- Entrada externa superior izquierda
        InB : in  STD_LOGIC; -- Entrada externa inferior izquierda
        e0  : out STD_LOGIC; -- Salida del deco (antiguo WPC)
        e1  : out STD_LOGIC; -- Salida del deco (antiguo WRI)
        e2  : out STD_LOGIC; -- Salida del deco (antiguo CPC)
        e3  : out STD_LOGIC  -- Salida del deco (antiguo 3)
    );
end Sec;

architecture Arq_sec of Sec is

    -- ========================================================
    -- DECLARACIÓN DE COMPONENTES
    -- ========================================================
    component FlipFlopD is
        Port (
            CLK : in  STD_LOGIC;
            D   : in  STD_LOGIC;
            Q   : out STD_LOGIC
        );
    end component;

    component Deco2a4 is
        Port (
            S : in  STD_LOGIC_VECTOR(1 downto 0);
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- ========================================================
    -- CABLES INTERNOS
    -- ========================================================
    -- Salidas de los Flip-Flops (Estado actual)
    signal q0, q1 : STD_LOGIC;
    
    -- Entradas de los Flip-Flops (Estado futuro)
    signal d0, d1 : STD_LOGIC;
    
    -- Inversores para la lógica combinacional
    signal q0_n, q1_n   : STD_LOGIC;
    signal InA_n, InB_n : STD_LOGIC;
    
    -- Salidas intermedias de las compuertas AND
    signal and_top, and_mid, and_bot : STD_LOGIC;
    
    -- Vector de conexión para el decodificador
    signal deco_in  : STD_LOGIC_VECTOR(1 downto 0);
    signal deco_out : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- 1. Inversores del circuito (Lógica continua de flujo de datos)
    q0_n  <= not q0;
    q1_n  <= not q1;
    InA_n <= not InA;
    InB_n <= not InB;

    -- 2. Ecuaciones booleanas para la lógica de entrada de los Flip-Flops
    -- Mapeo detallado del diagrama de compuertas:
    and_top <= InA_n and InB_n and q1;
    and_mid <= InA_n and InB and q1;
    
    -- Entrada D del Flip-Flop 0 (pasa por la compuerta OR)
    d0      <= and_top or and_mid;
    
    -- Entrada D del Flip-Flop 1 (compuerta AND inferior)
    d1      <= q1_n and InA;

    -- ========================================================
    -- 3. INSTANCIACIÓN DE FLIP-FLOPS (Módulos de Memoria)
    -- ========================================================
    FF0 : FlipFlopD 
        port map (
            CLK => CLK, 
            D   => d0, 
            Q   => q0
        );

    FF1 : FlipFlopD 
        port map (
            CLK => CLK, 
            D   => d1, 
            Q   => q1
        );

    -- ========================================================
    -- 4. CONEXIÓN DEL DECODIFICADOR DE SALIDA 2 A 4
    -- ========================================================
    -- Agrupamos las salidas de los Flip-Flops en el bus de selección
    deco_in <= q1 & q0;

    DECO_SALIDA : Deco2a4
        port map (
            S => deco_in,
            Y => deco_out
        );

    -- Asignación directa a los nuevos nombres de puertos requeridos
    e0 <= deco_out(0);
    e1 <= deco_out(1);
    e2 <= deco_out(2);
    e3 <= deco_out(3);

end Arq_sec;