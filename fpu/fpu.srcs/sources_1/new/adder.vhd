library global_main;
use global_main.fp_t;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is

    port (
        in1, in2 : in fp_t.fp;
        fp_added : out  fp_t.fp
    );
    
end adder;

architecture arch of adder is

    signal post_sort_larger, post_sort_smaller : fp_t.fp;
    signal post_add : fp_t.fp;
    
    -- post align specials vars --
    signal post_align_exp : std_logic_vector(fp_t.exp_width-1 downto 0);
    signal post_align_sig : std_logic_vector(fp_t.sig_width downto 0);
    
    -- MSB: carry => add to exponent
    signal added_sig : std_logic_vector(fp_t.sig_width downto 0);
    signal added_exp : std_logic_vector(fp_t.exp_width - 1 downto 0);
    
begin

--    c_sort:
--    fp_t.sort port map (
--        in1 => in1,
--        in2 => in2,
--        out_larger => post_sort_larger,
--        out_smaller => post_sort_smaller
--    );
    
--    c_align:
--    fp_t.align port map (
--        fp_in => post_sort_smaller,
--        amt => std_logic_vector(unsigned(post_sort_larger.exp) - unsigned(post_sort_smaller.exp)),
--        sig_out => post_align_sig,
--        exp_out => post_align_exp
--    );
    
--    added_sig <= std_logic_vector(unsigned(post_align_sig) + unsigned('1' & post_sort_larger.sig));
--    added_exp <= post_align_exp;
    
--    fp_added.sign <= '0';
--    fp_added.exp <= added_exp;
--    fp_added.sig <= added_sig(fp_t.sig_width-1 downto 0);
    
end arch;