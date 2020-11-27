library verilog;
use verilog.vl_types.all;
entity MCD_vlg_check_tst is
    port(
        CarryFlag       : in     vl_logic;
        DataOut         : in     vl_logic_vector(3 downto 0);
        PortID          : in     vl_logic_vector(2 downto 0);
        PortRead        : in     vl_logic;
        PortWrite       : in     vl_logic;
        ZeroFlag        : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end MCD_vlg_check_tst;
