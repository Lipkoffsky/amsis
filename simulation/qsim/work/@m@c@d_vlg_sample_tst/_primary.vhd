library verilog;
use verilog.vl_types.all;
entity MCD_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        DataIn          : in     vl_logic_vector(3 downto 0);
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end MCD_vlg_sample_tst;
