library verilog;
use verilog.vl_types.all;
entity ALU_ParallelCarry_vlg_check_tst is
    port(
        P               : in     vl_logic_vector(4 downto 1);
        R               : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end ALU_ParallelCarry_vlg_check_tst;
