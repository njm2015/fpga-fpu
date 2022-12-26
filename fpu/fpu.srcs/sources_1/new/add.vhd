library global_main;
use global_main.fp_t;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity add is
    
    generic (
        width : integer
    );
    port (
        in_vec1 : in std_logic_vector(width-1 downto 0);
        in_vec2 : in std_logic_vector(width-1 downto 0);
        out_vec : out std_logic_vector(width-1 downto 0);
        carry : out std_logic
    );
    
end add;

architecture arch of add is

    signal sum : std_logic_vector(width downto 0);

begin

    sum <= std_logic_vector(unsigned('0' & in_vec1) + unsigned('0' & in_vec2));
    
    carry <= sum(width);
    out_vec <= sum(width-1 downto 0);

end arch;
