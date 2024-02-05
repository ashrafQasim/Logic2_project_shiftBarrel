library ieee;
use ieee.std_logic_1164.all;


entity mux_2_to_1 is
	port(s0:in std_logic;
		  x:in  std_logic_vector(1 downto 0);
		  f:out std_logic);
end mux_2_to_1;

architecture mux_2_to_1_imp of mux_2_to_1 is 

	begin
	with s0 select 
		f <= x(0) when '0',
			  x(1) when others;
	
end architecture;