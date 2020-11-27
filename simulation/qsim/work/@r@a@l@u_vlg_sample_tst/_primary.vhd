library verilog;
use verilog.vl_types.all;
entity RALU_vlg_sample_tst is
    port(
        A_i             : in     vl_logic;
        DataIn_i        : in     vl_logic_vector(3 downto 0);
        ISL_i           : in     vl_logic;
        ISR_i           : in     vl_logic;
        M_i             : in     vl_logic;
        P0_i            : in     vl_logic;
        S_i             : in     vl_logic_vector(3 downto 0);
        adr_i           : in     vl_logic_vector(2 downto 0);
        clk_i           : in     vl_logic;
        rst_i           : in     vl_logic;
        v_i             : in     vl_logic_vector(3 downto 0);
        wr_i            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end RALU_vlg_sample_tst;
