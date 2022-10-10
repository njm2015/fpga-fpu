library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sort is

    generic (
        exp_width : integer;
        sig_width : integer
    );
    port (
        float1, float2 : in std_logic_vector ((exp_width + sig_width) downto 0);
        larger, smaller : out std_logic_vector ((exp_width + sig_width) downto 0)
    );

end sort;

architecture arch of sort is

    signal exp1_gt, sig1_gt, exp_eq : boolean;

begin

    sig1_gt <= (unsigned(float1(sig_width-1 downto 0)) > unsigned(float2(sig_width-1 downto 0)));
    exp1_gt <= (unsigned(float1(exp_width + sig_width - 1 downto sig_width)) > unsigned(float2(exp_width + sig_width - 1 downto sig_width)));
    exp_eq <= (unsigned(float1(exp_width + sig_width - 1 downto sig_width)) = unsigned(float2(exp_width + sig_width - 1 downto sig_width)));
    
    larger  <= float1 when (exp1_gt or (exp_eq and sig1_gt)) else float2;
    smaller <= float2 when (exp1_gt or (exp_eq and sig1_gt)) else float1;

end arch;
