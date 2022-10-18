library lib_fp;
package fp_t is new lib_fp.adder_pkg
    generic map (sig_width => 4, exp_width => 3);

------------------------------------------------------

library ieee;
library lib_fp;
use ieee.std_logic_1164.all;
use work.fp_t;


entity main is
    
    port (
        in1, in2 : in std_logic_vector(6 downto 0);
        led_out1, led_out2 : out std_logic_vector(6 downto 0)
    );
    
end main;

architecture arch of main is

    signal fp1, fp2, larger, smaller : fp_t.fp;
    
    component adder
    port (
        in1, in2 : in fp_t.fp;
        out_larger, out_smaller : out fp_t.fp
    );
    end component adder;

begin

    fp1.sign <= '0';
    fp1.sig <= in1(3 downto 0);
    fp1.exp <= in1(6 downto 4);
    
    fp2.sign <= '0';
    fp2.sig <= in2(3 downto 0);
    fp2.exp <= in2(6 downto 4);
    
    adder_inst: adder
    port map (
        in1 => fp1,
        in2 => fp2,
        out_larger => larger,
        out_smaller => smaller
    );
    
    led_out1 <= smaller.exp & smaller.sig;
    led_out2 <= larger.exp & larger.sig;

end arch;
