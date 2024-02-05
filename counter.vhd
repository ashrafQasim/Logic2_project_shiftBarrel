library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  

entity counter is
    port(
        C, CLR : in std_logic;
        Q : out std_logic_vector(3 downto 0)
    );
end counter;

architecture counter_imp of counter is
   signal tmp: unsigned(3 downto 0) := (others => '0');  
	begin
	 process (C, CLR)
		 begin
			  if (CLR = '0') then
					tmp <= (others => '0');
			  elsif rising_edge(C) then  
					tmp <= tmp + 1;
			  end if;
	 end process;

		 Q <= std_logic_vector(tmp);
end architecture;
