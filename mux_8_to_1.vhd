library ieee;
use ieee.std_logic_1164.all;

entity mux_8_to_1 is
		port(S:in  std_logic_vector(2 downto 0);
			  F:out std_logic;
			  x:in  std_logic_vector(8 downto 1) );
end mux_8_to_1;

architecture mux_8_to_1_imp of mux_8_to_1 is

	begin
		with S select --CBA
		F <= x(1) when "000",
			  x(2) when "001",
			  x(3) when "010",
			  x(4) when "011",
			  x(5) when "100",
			  x(6) when "101",
			  x(7) when "110",
			  x(8) when others;
end architecture;