library lib_fp;
use lib_fp.all;

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
begin

    fp_sort:
    entity lib_common.sort_com(floating_point)
    generic map(
        sig_width => sort.sig_width,
        exp_width => sort.exp_width,
        fixed_width => sort.sig_width + sort.exp_width
    ) port map (
        num1 => in1.sig & in1.exp,
        num2 => in2.sig & in2.exp,
        larger => out_larger.sig & out_larger.exp,
        smaller => out_smaller.sig & out_smaller.exp
    );

end arch;
