library lib_fp;

package fp_t is new lib_fp.adder_pkg
    generic map (sig_width => 4, exp_width => 3);

use work.fp_t;

library lib_fp;
library ieee;
use ieee.std_logic_1164.all;

entity adder_sim is
end adder_sim;

architecture arch_sim of adder_sim is

    signal in1, in2 : fp_t.fp;
    signal fp_added : fp_t.fp;
    
    
    component adder
    port (
        in1, in2 : in fp_t.fp;
        fp_added : out fp_t.fp 
    );
    end component;

begin

    uut: adder
    port map (
        in1 => in1,
        in2 => in2,
        fp_added => fp_added
    );
    
    process begin
    
        in1.sign <= '0';
        in1.sig <= "0000";
        in1.exp <= "000";
        
        in2.sign <= '0';
        in2.sig <= "0000";
        in2.exp <= "000";
    
        wait for 10 ns;
        
        in1.exp <= "100";
        in2.exp <= "110";
        
        wait for 10 ns;  
    
    end process;

end arch_sim;
