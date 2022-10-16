library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sort_com is

    generic (
        exp_width : integer := 0;
        sig_width : integer := 0;
        fixed_width : integer := 0
    );
    port (
        num1, num2 : in std_logic_vector(fixed_width-1 downto 0);
        larger, smaller : out std_logic_vector(fixed_width-1 downto 0)
    );

end sort_com;

-------------------------------------------------------------------------------

architecture floating_point of sort_com is

    signal exp1_gt, sig1_gt, exp_eq : boolean;

begin

    sig1_gt <= (unsigned(num1(sig_width-1 downto 0)) > unsigned(num2(sig_width-1 downto 0)));
    exp1_gt <= (unsigned(num1(exp_width + sig_width - 1 downto sig_width)) > unsigned(num2(exp_width + sig_width - 1 downto sig_width)));
    exp_eq <= (unsigned(num1(exp_width + sig_width - 1 downto sig_width)) = unsigned(num2(exp_width + sig_width - 1 downto sig_width)));
    
    larger  <= num1 when (exp1_gt or (exp_eq and sig1_gt)) else num2;
    smaller <= num2 when (exp1_gt or (exp_eq and sig1_gt)) else num1;

end floating_point;

-------------------------------------------------------------------------------

architecture fixed_width of sort_com is

begin

    larger <= num1 when unsigned(num1) > unsigned(num2) else num2;
    smaller <= num2 when unsigned(num1) > unsigned(num2) else num1;

end fixed_width;
