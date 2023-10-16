library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity edge_detector is
	Port (sig   : in std_logic;
	      clk   : in std_logic;
	      edge  : out std_logic); 
end edge_detector; 

architecture rtl of edge_detector is 

signal ff1 :std_logic;
signal ff2 :std_logic;

begin

p_edge : process (clk) is  
	begin
		if rising_edge(clk) then
			ff1 <= sig;
		    	ff2 <= ff1;
		    	edge <= ff1 and not(ff2);
		end if;
	end process;	

end rtl; 

