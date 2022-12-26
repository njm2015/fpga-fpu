library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.ceil;
use ieee.math_real.log2;

library lib_fp;

package adder_pkg is

    -- generic with derived constant
    generic (
        sig_width : integer;
        exp_width : integer
    );
    
    -- define fp type -------------------------------------
    type fp is record
        sign : std_logic;
        exp : std_logic_vector(exp_width-1 downto 0);
        sig : std_logic_vector(sig_width-1 downto 0);        
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
    component align is 
    generic (
        sig_width : integer := sig_width;
        exp_width : integer := exp_width
    );
    port (
        fp_in : in fp;
        amt : in std_logic_vector(exp_width-1 downto 0);
        sig_out : out std_logic_vector(sig_width downto 0);
        exp_out : out std_logic_vector(exp_width-1 downto 0)
    );
    end component;
    
end package;