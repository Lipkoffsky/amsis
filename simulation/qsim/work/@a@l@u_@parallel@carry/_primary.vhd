library verilog;
use verilog.vl_types.all;
entity ALU_ParallelCarry is
    port(
        P               : out    vl_logic_vector(4 downto 1);
        P0              : in     vl_logic;
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        M               : in     vl_logic;
        S               : in     vl_logic_vector(3 downto 0);
        R               : out    vl_logic_vector(3 downto 0)
    );
end ALU_ParallelCarry;
