library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.ceil;
use ieee.math_real.log2;

library lib_fp;

package adder_pkg is

    -- generic with derived constant
    generic (
        sig_width : integer
    );
    constant exp_width : integer := integer(ceil(log2(real(sig_width))));
    
    -- define fp type -------------------------------------
    type fp is record
        sign : std_logic;
        sig : std_logic_vector(sig_width-1 downto 0);
        exp : std_logic_vector(exp_width-1 downto 0);
    end record;
    
    ----------------------------------------------------------
    -- component declarations --------------------------------
    ----------------------------------------------------------
    
    -- SORT --------------------------------------------------
    component sort is
    generic (
        sig_width : integer := sig_width;
        exp_width : integer := exp_width
    );
    port (
        in1, in2 : in fp;
        out_larger, out_smaller : out fp
    );
    end component;
    
    
    -- ALIGN -------------------------------------------------
    
    
end package;