library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package newtype is
	type matrix is array(0 to 5) of std_logic_vector(3 downto 0);
end newtype;
