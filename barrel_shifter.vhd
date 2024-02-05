library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity barrel_shifter is
	port(input_date      : in  std_logic_vector(7 downto 0);
		  sel			      : buffer  std_logic_vector(2 downto 0);
		  operation			: in  std_logic_vector(2 downto 0);
		  clk             : in  std_logic;
		  Number_of_steps : in  std_logic_vector(3 downto 0);
		  output_date     : buffer std_logic_vector(7 downto 0) );
end barrel_shifter;



architecture barrel_shifter_imp of barrel_shifter is

-- ========================================
	component mux_8_to_1 is
		port(S:in  std_logic_vector(2 downto 0);
			  F:out std_logic;
			  x:in  std_logic_vector(8 downto 1) );
	end component;
-- ========================================
	component mux_2_to_1 is
		port(s0:in  std_logic;
			  x :in  std_logic_vector(1 downto 0);
			  f :out std_logic);
	end component;

-- ========================================
	component counter is
    port(
        C, CLR : in std_logic;
        Q : out std_logic_vector(3 downto 0)
    );
	end component;
-- ========================================
	component D_flip_flop is
		 Port ( clk : in STD_LOGIC;
				  rst : in STD_LOGIC;
					 d : in STD_LOGIC;
					 q : out STD_LOGIC);
	end component;
-- ========================================
	signal int_x   : std_logic_vector(8 downto 1);
	signal int_q   : std_logic_vector(1 to 8);
	signal int_sel : std_logic_vector(2 downto 0);
	signal op      : std_logic_vector(2 downto 0) := "100";
	signal int_N   : std_logic_vector(3 downto 0) := "0000";
	signal EN 		: std_LOGIC := '0';
	signal int_I   : std_logic_vector(3 downto 0); 
	signal t_clk_1 : std_LOGIC := '0';
	signal test : std_LOGIC := '0';
-- ========================================
	begin
	
	op <= operation ;
	DFF_1 	  : D_flip_flop port map(clk,'0',int_x(1),int_q(1));
	DFF_2 	  : D_flip_flop port map(clk,'0',int_x(2),int_q(2));
	DFF_3 	  : D_flip_flop port map(clk,'0',int_x(3),int_q(3));
	DFF_4 	  : D_flip_flop port map(clk,'0',int_x(4),int_q(4));
	DFF_5 	  : D_flip_flop port map(clk,'0',int_x(5),int_q(5));
	DFF_6 	  : D_flip_flop port map(clk,'0',int_x(6),int_q(6));
	DFF_7 	  : D_flip_flop port map(clk,'0',int_x(7),int_q(7));
	DFF_8      : D_flip_flop port map(clk,'0',int_x(8),int_q(8));
	DFF_test   : D_flip_flop port map(t_clk_1,'0','1',EN);
	DFF_test1  : D_flip_flop port map(clk,'0','1',test);


	
	

	MUX2_A :mux_2_to_1 port map(s0=>test,x(0)=>'0',x(1)=>op(0),f=>sel(0));
	MUX2_B :mux_2_to_1 port map(s0=>test,x(0)=>'0',x(1)=>op(1),f=>sel(1));
	MUX2_C :mux_2_to_1 port map(s0=>test,x(0)=>'1',x(1)=>op(2),f=>sel(2));

	
	MUX8_1 : mux_8_to_1
   port map (
       S(0) => int_sel(0),
       S(1) => int_sel(1),
       S(2) => int_sel(2),
       F    => int_x(1),
		 X(1) => int_q(1),
       X(2) => '0',
       X(3) => int_q(1),
       X(4) => int_q(8),
       X(5) => input_date(7),
       X(6) => int_q(2),
       X(7) => int_q(2),
       X(8) => int_q(2)
   );

	 	MUX8_2 : mux_8_to_1
    port map (
        S(0) => int_sel(0),
        S(1) => int_sel(1),
        S(2) => int_sel(2),
        F    => int_x(2),
		  X(1) => int_q(2),
        X(2) => int_q(1),
        X(3) => int_q(1),
        X(4) => int_q(1),
        X(5) => input_date(6),
        X(6) => int_q(3),
        X(7) => int_q(3),
        X(8) => int_q(3)
    );

		MUX8_3 : mux_8_to_1
    port map (
        S(0) => int_sel(0),
        S(1) => int_sel(1),
        S(2) => int_sel(2),
        F    => int_x(3),
		  X(1) => int_q(3),
        X(2) => int_q(2),
        X(3) => int_q(2),
        X(4) => int_q(2),
        X(5) => input_date(5),
        X(6) => int_q(4),
        X(7) => int_q(4),
        X(8) => int_q(4)
    );

		MUX8_4 : mux_8_to_1
    port map (
        S(0) => int_sel(0),
        S(1) => int_sel(1),
        S(2) => int_sel(2),
        F    => int_x(4),
		  X(1) => int_q(4),
        X(2) => int_q(3),
        X(3) => int_q(3),
        X(4) => int_q(3),
        X(5) => input_date(4),
        X(6) => int_q(5),
        X(7) => int_q(5),
        X(8) => int_q(5)
    );

		MUX8_5 : mux_8_to_1
    port map (
        S(0) => int_sel(0),
        S(1) => int_sel(1),
        S(2) => int_sel(2),
        F    => int_x(5),
		  X(1) => int_q(5),
        X(2) => int_q(4),
        X(3) => int_q(4),
        X(4) => int_q(4),
        X(5) => input_date(3),
        X(6) => int_q(6),
        X(7) => int_q(6),
        X(8) => int_q(6)
    );

		MUX8_6 : mux_8_to_1
    port map (
        S(0) => int_sel(0),
        S(1) => int_sel(1),
        S(2) => int_sel(2),
        F    => int_x(6),
		  X(1) => int_q(6),
        X(2) => int_q(5),
        X(3) => int_q(5),
        X(4) => int_q(5),
        X(5) => input_date(2),
        X(6) => int_q(7),
        X(7) => int_q(7),
        X(8) => int_q(7)
    );

		MUX8_7 : mux_8_to_1
    port map (
        S(0) => int_sel(0),
        S(1) => int_sel(1),
        S(2) => int_sel(2),
        F    => int_x(7),
		  X(1) => int_q(7),
        X(2) => int_q(6),
        X(3) => int_q(6),
        X(4) => int_q(6),
        X(5) => input_date(1),
        X(6) => int_q(8),
        X(7) => int_q(8),
        X(8) => int_q(8)
    );

		MUX8_8 : mux_8_to_1
    port map (
        S(0) => int_sel(0),
        S(1) => int_sel(1),
        S(2) => int_sel(2),
        F    => int_x(8),
		  X(1) => int_q(8),
        X(2) => int_q(7),
        X(3) => int_q(7),
        X(4) => int_q(7),
        X(5) => input_date(0),
        X(6) => '0',
        X(7) => int_q(8),
        X(8) => int_q(1)
    );

	  counter_N : counter port map (
		 C  	 => clk,
		 CLR   => '0',    
		 Q     => int_I );
		 
		int_N       <= std_logic_vector(unsigned(Number_of_steps) + 1);

	

	  	t_clk_1    <= (int_N(0)xnor int_I(0)) and (int_N(1)xnor int_I(1)) and (int_N(2)xnor int_I(2)) and (int_N(3)xnor int_I(3));
	 

		int_sel(0) <= (not EN) and sel(0);
		int_sel(1) <= (not EN) and sel(1);
		int_sel(2) <= (not EN) and sel(2);
		

		output_date <= int_q;



end architecture;