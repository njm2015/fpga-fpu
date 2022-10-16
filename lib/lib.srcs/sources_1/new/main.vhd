library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity main is

    port (
        sw : in std_logic_vector(7 downto 0);
        led : out std_logic_vector(7 downto 0)
    );

end main;

architecture arch of main is

begin

    sorter:
    entity work.sort_com(fixed_width)
        generic map (
            fixed_width => 4
        ) port map (
            num1 => sw(3 downto 0),
            num2 => sw(7 downto 4),
            smaller => led(3 downto 0),
            larger => led(7 downto 4)
    );
    
end arch;