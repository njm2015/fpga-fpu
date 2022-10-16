library ieee;
use ieee.std_logic_1164.all;

package fp_type is

    generic (
        sig_width : integer;
        exp_width : integer
    );
    
    type fp is record
        sign : std_logic;
        sig : std_logic_vector(sig_width-1 downto 0);
        exp : std_logic_vector(exp_width-1 downto 0);
    end record;

end package;
