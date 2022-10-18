library global_main;
use global_main.fp_t;

entity adder is

    port (
        in1, in2 : in fp_t.fp;
        out_larger, out_smaller : out fp_t.fp
    );
    
end adder;

architecture arch of adder is

    signal post_sort_larger, post_sort_smaller : fp_t.fp;
    signal post_align1, post_align2 : fp_t.fp;
    signal post_add : fp_t.fp;

begin

    c_sort:
    fp_t.sort port map (
        in1 => in1,
        in2 => in2,
        out_larger => post_sort_larger,
        out_smaller => post_sort_smaller
    );
    
    out_larger <= post_sort_larger;
    out_smaller <= post_sort_smaller;
    
end arch;