-- fp_t MUST BE DECLARED BY MAIN ENTITY
library global_main;
use global_main.fp_t;
-- fp_t MUST BE DECLARED BY MAIN ENTITY

entity sort is
    
    generic (
        sig_width : integer := fp_t.sig_width;
        exp_width : integer := fp_t.exp_width
    );
    
    port (
        in1, in2 : in fp_t.fp;
        out_larger, out_smaller : out fp_t.fp
    );
    
end sort;

library ieee;
library lib_common;
use ieee.std_logic_1164.all;

architecture arch of sort is
    
    signal out_larger_vec, out_smaller_vec : std_logic_vector(fp_t.sig_width + fp_t.exp_width - 1 downto 0);

begin

    fp_sort:
    entity lib_common.sort_com(floating_point)
    generic map(
        sig_width => sort.sig_width,
        exp_width => sort.exp_width,
        fixed_width => sort.sig_width + sort.exp_width
    ) port map (
        num1 => in1.exp & in1.sig,
        num2 => in2.exp & in2.sig,
        larger => out_larger_vec,
        smaller => out_smaller_vec
    );
    
    out_larger.sign <= '0';     -- TODO IMPLEMENT SIGN
    out_larger.sig <= out_larger_vec(fp_t.sig_width-1 downto 0);
    out_larger.exp <= out_larger_vec(fp_t.sig_width + fp_t.exp_width - 1 downto fp_t.sig_width);

    out_smaller.sign <= '0';       -- TODO IMPLEMENT SIGN
    out_smaller.sig <= out_smaller_vec(fp_t.sig_width-1 downto 0);
    out_smaller.exp <= out_smaller_vec(fp_t.sig_width + fp_t.exp_width - 1 downto fp_t.sig_width);

end arch;
