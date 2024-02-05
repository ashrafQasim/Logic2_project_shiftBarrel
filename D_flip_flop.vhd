library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity D_flip_flop is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           d : in STD_LOGIC;
           q : out STD_LOGIC);
end D_flip_flop;

architecture D_flip_flop_imp of D_flip_flop is
    signal internal_q : STD_LOGIC := '0';
    
begin
    process(clk, rst)
    begin
        if rst = '0' then
            internal_q <= '0';
        elsif rising_edge(clk) then
            internal_q <= d;
        end if;
    end process;

    q <= internal_q; 
end architecture;
