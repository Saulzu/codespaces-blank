library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Unidad_Control is
    Port (
        CLK           : in  STD_LOGIC;
        -- Entradas de control externas / condición
        InA           : in  STD_LOGIC;                     -- Para el secuenciador
        InB           : in  STD_LOGIC;                     -- Para el secuenciador
        w_prime       : in  STD_LOGIC;                     -- Señal w' del diagrama
        mw_param      : in  STD_LOGIC;                     -- Parámetro de la instrucción para MW
        
        -- Entrada de datos de memoria hacia los registros de control
        D_Memoria_16  : in  STD_LOGIC_VECTOR(15 downto 0); -- Carga para el PC
        D_Memoria_26  : in  STD_LOGIC_VECTOR(25 downto 0); -- Datos para el IR
        
        -- Salidas de control para el Datapath y Memoria
        PC_Out        : out STD_LOGIC_VECTOR(15 downto 0); -- Dirección actual de instrucción
        IR_Out        : out STD_LOGIC_VECTOR(25 downto 0); -- Instrucción completa decodificada
        MW_Output     : out STD_LOGIC                      -- Señal MW' hacia la memoria
    );
end Unidad_Control;

architecture Structural of Unidad_Control is

    -- ========================================================
    -- DECLARACIÓN DE COMPONENTES
    -- ========================================================
    -- 1. Secuenciador (Circuito Secuencial previo)
    component Circuito_Secuencial is
        Port (
            CLK : in  STD_LOGIC;
            InA : in  STD_LOGIC;
            InB : in  STD_LOGIC;
            e0  : out STD_LOGIC;
            e1  : out STD_LOGIC;
            e2  : out STD_LOGIC;
            e3  : out STD_LOGIC
        );
    end component;

    -- 2. Contador de Programa de 16 bits (Estructural con Mux2a1)
    component PC_Counter is
        Port (
            CLK : in  STD_LOGIC;
            W   : in  STD_LOGIC;
            C   : in  STD_LOGIC_VECTOR(15 downto 0);
            Q   : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    -- 3. Registro de Instrucciones de 26 bits
    component IR_Register is
        Port (
            CLK : in  STD_LOGIC;
            W   : in  STD_LOGIC;
            D   : in  STD_LOGIC_VECTOR(25 downto 0);
            Q   : out STD_LOGIC_VECTOR(25 downto 0)
        );
    end component;

    -- ========================================================
    -- CABLES INTERNOS
    -- ========================================================
    -- Estados salientes del Secuenciador
    signal e0, e1, e2, e3 : STD_LOGIC;
    
    -- Cables para las habilitaciones de escritura finales (Compuertas AND)
    signal w_ir : STD_LOGIC; -- Salida de la compuerta WS

begin

    -- ========================================================
    -- 1. INSTANCIACIÓN DEL SECUENCIADOR
    -- ========================================================
    SECUENCIADOR_INST : Circuito_Secuencial
        port map (
            CLK => CLK,
            InA => InA,
            InB => InB,
            e0  => e0,
            e1  => e1,
            e2  => e2,
            e3  => e3
        );

    -- ========================================================
    -- 2. INSTANCIACIÓN DEL CONTADOR DE PROGRAMA (PC)
    -- ========================================================
    -- Segun el diagrama, la línea de control W del PC se activa directamente con e0
    PC_BLOCK : PC_Counter
        port map (
            CLK => CLK,
            W   => e0,
            C   => D_Memoria_16,
            Q   => PC_Out
        );

    -- ========================================================
    -- 3. COMPUERTAS LÓGICAS CONCURRENTES (WS y MWS)
    -- ========================================================
    -- Compuerta AND "WS": Habilita el IR si estamos en el estado e1 y w' está activo
    w_ir <= e1 and w_prime;

    -- Compuerta AND "MWS": Genera MW' cruzando el estado e1 y el parámetro de memoria
    MW_Output <= e1 and mw_param;

    -- ========================================================
    -- 4. INSTANCIACIÓN DEL REGISTRO DE INSTRUCCIONES (IR)
    -- ========================================================
    IR_BLOCK : IR_Register
        port map (
            CLK => CLK,
            W   => w_ir,
            D   => D_Memoria_26,
            Q   => IR_Out
        );

end Arq_Uc;