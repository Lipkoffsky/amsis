library verilog;
use verilog.vl_types.all;
entity MCD is
    port(
        PortRead        : out    vl_logic;
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        CarryFlag       : out    vl_logic;
        ZeroFlag        : out    vl_logic;
        DataIn          : in     vl_logic_vector(3 downto 0);
        DataOut         : out    vl_logic_vector(3 downto 0);
        PortWrite       : out    vl_logic;
        PortID          : out    vl_logic_vector(2 downto 0)
    );
end MCD;
