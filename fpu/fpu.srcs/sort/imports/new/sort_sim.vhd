library lib_fp;

package fp_t is new lib_fp.adder_pkg
    generic map (sig_width => 4, exp_width => 3);

-------------------------------------------------------------------------

use work.fp_t;

library ieee;
use ieee.std_logic_1164.all;

entity sort_sim is
end sort_sim;

architecture arch_sim of sort_sim is

    signal in1, in2, out_larger, out_smaller : fp_t.fp;

begin

    uut: fp_t.sort port map (
        in1 => in1,
        in2 => in2,
        out_larger => out_larger,
        out_smaller => out_smaller
    );
    

    
    process
    begin
    
        in1.sign <= '0';
        in1.sig <= "0000";
        in1.exp <= "000";
        
        in2.sign <= '0';
        in2.sig <= "0000";
        in2.exp <= "000";
    
        wait for 10 ns;
        
        in2.sig <= "0001";
        wait for 10 ns;
        
        in1.exp <= "001";
        wait for 10 ns;
    
    end process;

end arch_sim;
