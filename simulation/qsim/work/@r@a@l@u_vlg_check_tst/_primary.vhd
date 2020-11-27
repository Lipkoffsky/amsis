library verilog;
use verilog.vl_types.all;
entity RALU_vlg_check_tst is
    port(
        OSL_o           : in     vl_logic;
        OSR_o           : in     vl_logic;
        P4_o            : in     vl_logic;
        R_o             : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end RALU_vlg_check_tst;
