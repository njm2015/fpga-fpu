library global_main;
use global_main.fp_t;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.ceil;
use ieee.math_real.log2;

library lib_common;

entity align is
    
    generic (
        sig_width : integer;
        exp_width : integer
    );
    port (
        fp_in : in fp_t.fp;
        amt : in std_logic_vector(fp_t.exp_width-1 downto 0);
        sig_out : out std_logic_vector(sig_width downto 0);
        exp_out : out std_logic_vector(exp_width-1 downto 0)
    );
    
end align;

architecture arch of align is

    signal v_out : std_logic_vector(sig_width downto 0);
    signal new_exp : std_logic_vector(exp_width-1 downto 0);

begin

    shifter:
    entity lib_common.shift_com
    generic map (
        v_width => sig_width + 1,
        amt_width => exp_width
    ) port map (
        v_in => '1' & fp_in.sig,
        shift_amt => unsigned(amt),
        left => '0',
        v_out => v_out
    );
    
    new_exp <= std_logic_vector(unsigned(fp_in.exp) + unsigned(amt));
    
    -- if fp_in is positive and new_exp is negative, we overflowed;
    sig_out <= (others => '0') when (not fp_in.exp(exp_width-1) and new_exp(exp_width-1)) else v_out(sig_width downto 0);
    exp_out <= (others => '0') when (not fp_in.exp(exp_width-1) and new_exp(exp_width-1)) else new_exp;    

end arch;
