library global_main;
use global_main.fp_t;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_fp;

entity align_sim is
end align_sim;

architecture arch_sim of align_sim is

    signal fp_in: fp_t.fp;
    signal amt : std_logic_vector(fp_t.exp_width-1 downto 0);
    signal sig_out : std_logic_vector(fp_t.sig_width-1 downto 0);
    signal exp_out : std_logic_vector(fp_t.exp_width-1 downto 0);

begin

    uut:
    entity lib_fp.align
    generic map (
        sig_width => fp_t.sig_width,
        exp_width => fp_t.exp_width
    ) port map (
        fp_in => fp_in,
        amt => amt,
        sig_out => sig_out,
        exp_out => exp_out
    );
    
    process
    begin
    
        fp_in.sign <= '0';
        fp_in.sig <= "0000";
        fp_in.exp <= "000";
        amt <= "000";
        
        wait for 10 ns;
        
        fp_in.exp <= "100";
        wait for 10 ns;
        
        amt <= "010";
        wait for 10 ns;
    
    end process;


end arch_sim;
