library verilog;
use verilog.vl_types.all;
entity ALU_ParallelCarry_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        M               : in     vl_logic;
        P0              : in     vl_logic;
        S               : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end ALU_ParallelCarry_vlg_sample_tst;
