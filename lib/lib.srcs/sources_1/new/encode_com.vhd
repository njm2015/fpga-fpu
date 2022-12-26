library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.ceil;
use ieee.math_real.log2;

entity encode_com is
    
    generic(
        in_width : integer;
        out_width : integer := integer(ceil(log2(real(in_width))))
    );
    
    port (
        v_in : std_logic_vector(in_width-1 downto 0);
        v_out : std_logic_vector(out_width-1 downto 0);
    );
    
end encode_com;

architecture arch of encode_com is

begin


end Behavioral;
