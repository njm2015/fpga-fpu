library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_sim is
end shift_sim;

architecture arch_sim of shift_sim is

    signal v_in, v_out : std_logic_vector(3 downto 0) := (others => '0');
    signal shift_amt : unsigned(2 downto 0) := "000";

begin

    uut: entity work.shift(left)
    generic map (
        width => 4
    )
    port map (
        v_in => v_in,
        shift_amt => shift_amt,
        v_out => v_out,
        left => '1'
    );
    
    process
    begin
    
        wait for 10 ns;
        
        v_in <= "1000";
        wait for 10 ns;
        
        shift_amt <= "001";
        wait for 10 ns;
        
        shift_amt <= "010";
        wait for 10 ns;
        
        shift_amt <= "011";
        wait for 10 ns;
        
        shift_amt <= "100";
        wait for 10 ns;
        
        v_in <= "1111";
        wait for 10 ns;
        
        shift_amt <= "011";
        wait for 10 ns;
        
        shift_amt <= "010";
        wait for 10 ns;
        
        shift_amt <= "001";
        wait for 10 ns;
        
        shift_amt <= "000";
        wait for 10 ns;
        
        
    end process;

end arch_sim;
