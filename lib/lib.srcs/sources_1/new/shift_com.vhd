library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_com is

    generic (
        v_width : integer;
        amt_width : integer
    );
    port (
        v_in : in std_logic_vector(v_width-1 downto 0);
        shift_amt : in unsigned(amt_width-1 downto 0);
        left : in std_logic;
        
        v_out : out std_logic_vector(v_width-1 downto 0)
    );

end shift_com;

architecture left of shift_com is

    constant zero : std_logic_vector(2**shift_amt'length downto 0) := (others => '0');
    type shift_vec is array (0 to shift_amt'length) of std_logic_vector(v_width-1 downto 0);
    signal shifted : shift_vec := (others => (others => '0'));

begin

    shifted(0) <= v_in;

    shift_gen:
    for i in 1 to shift_amt'length generate
        shifted(i) <= zero((2**i)-2 downto 2**(i-1)-1) & shifted(i-1)(v_width-1 downto 2**(i-1)) when shift_amt(i-1) = '1' else shifted(i-1);
    end generate;
    
    v_out <= shifted(shift_amt'length);

end left;
