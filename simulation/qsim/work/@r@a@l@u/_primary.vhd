library verilog;
use verilog.vl_types.all;
entity RALU is
    port(
        clk_i           : in     vl_logic;
        rst_i           : in     vl_logic;
        DataIn_i        : in     vl_logic_vector(3 downto 0);
        S_i             : in     vl_logic_vector(3 downto 0);
        M_i             : in     vl_logic;
        P0_i            : in     vl_logic;
        A_i             : in     vl_logic;
        v_i             : in     vl_logic_vector(3 downto 0);
        wr_i            : in     vl_logic;
        adr_i           : in     vl_logic_vector(2 downto 0);
        ISR_i           : in     vl_logic;
        ISL_i           : in     vl_logic;
        OSR_o           : out    vl_logic;
        OSL_o           : out    vl_logic;
        P4_o            : out    vl_logic;
        R_o             : out    vl_logic_vector(3 downto 0)
    );
end RALU;
