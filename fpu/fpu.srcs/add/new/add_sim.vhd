library global_main;
use global_main.fp_t;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_fp;

entity add_sim is
end add_sim;

architecture arch_sim of add_sim is

    signal addend1, addend2, sum : std_logic_vector(3 downto 0);
    signal carry : std_logic;

begin

    uut:
    entity lib_fp.add
    generic map (
        width => 4
    ) port map (
        in_vec1 => addend1,
        in_vec2 => addend2,
        out_vec => sum,
        carry => carry
    );
    
    process
    begin
    
        addend1 <= (others => '0');
        addend2 <= (others => '0');
        wait for 10 ns;
        
        addend1 <= "0001";
        wait for 10 ns;
        
        addend2 <= "0001";
        wait for 10 ns;
        
        addend1 <= "1111";
        wait for 10 ns;
        
    end process;

end arch_sim;
