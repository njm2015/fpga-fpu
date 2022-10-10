library ieee;
use ieee.std_logic_1164.all;

entity sort_sim is
end sort_sim;

architecture arch_sim of sort_sim is

    signal float1, float2, larger, smaller : std_logic_vector(8 downto 0) := (others => '0');

begin

    uut: entity work.sort(arch)
        generic map (
            exp_width => 4,
            sig_width => 4
        ) port map (
            float1 => float1,
            float2 => float2,
            larger => larger,
            smaller => smaller
        );

    process
    begin
    
        wait for 10 ns;
        
        float1 <= "000010000";
        float2 <= "000000000";
        wait for 10 ns;
        
        float2 <= "000100000";
        wait for 10 ns;
        
        float1 <= "000100001";
        wait for 10 ns;
    
    end process;

end arch_sim;
