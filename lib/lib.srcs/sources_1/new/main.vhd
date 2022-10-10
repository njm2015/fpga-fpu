library ieee;
use ieee.std_logic_1164.all;

entity main is

    port (
        sw : in std_logic_vector(7 downto 0);
        led : out std_logic_vector(7 downto 0)
    );

end main;

architecture arch of main is

    signal out1, out2 : std_logic_vector(4 downto 0);

begin

    sorter: entity work.sort(arch)
    generic map (
        exp_width => 2,
        sig_width => 2
    ) port map (
        float1 => '0' & sw(3 downto 0),
        float2 => '0' & sw(7 downto 4),
        smaller => out1,
        larger => out2
    );
    
    led(3 downto 0) <= out1(3 downto 0);
    led(7 downto 4) <= out2(3 downto 0);
    
end arch;
