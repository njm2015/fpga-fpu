library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity align is
    
    generic (
        sig_width : integer;
        exp_width : integer
    );
    port (
        num1, num2 : in std_logic_vector(sig_width + exp_width downto 0);
        out1, out2 : out std_logic_vector(sig_width + exp_width downto 0)
    );
    
end align;

architecture arch of align is

begin

    

end arch;
