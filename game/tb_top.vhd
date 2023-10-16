library ieee;
use ieee.std_logic_1164.all;

entity tb_top is
end tb_top;

architecture str of tb_top is


  signal CLK100MHZ     : std_logic := '0';
  signal uart_txd_in   : std_logic;
  signal uart_rxd_out  : std_logic;
  signal button_in     : std_logic_vector(3 downto 0);
  signal led           : std_logic_vector(3 downto 0);
  signal led_red       : std_logic_vector(3 downto 0);
  signal led_green     : std_logic_vector(3 downto 0);
  signal led_level     : std_logic_vector(3 downto 0);
  signal rst           : std_logic := '0';

begin

DUT : entity work.top

port map (CLK100MHZ => CLK100MHZ, uart_txd_in => uart_txd_in, uart_rxd_out => uart_rxd_out, rst => rst,
	button_in => button_in, led => led, led_red => led_red, led_green => led_green, led_level => led_level);

p_clk : process
    begin
        CLK100MHZ <= '0'; wait for 5 ns; CLK100MHZ <= '1'; wait for 5 ns;
    end process;
    
    input : process
    begin
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us; 
        
        uart_txd_in <= '0'; wait for 8.68 us;   -- start bit
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;    
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;  
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;    
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;        
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us;   -- stop bit
        uart_txd_in <= '0'; wait for 8.68 us;   -- start bit             
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;    
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us; 
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us;   -- stop bit
        uart_txd_in <= '0'; wait for 8.68 us;   -- start bit  
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us;    
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us; 
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;    
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us; 
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us;   -- stop bit
        uart_txd_in <= '0'; wait for 8.68 us;   -- start bit     
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us;
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;    
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us; 
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us;   -- stop bit
        uart_txd_in <= '0'; wait for 8.68 us;   -- start bit   
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;    
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us; 
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us;   -- stop bit
        uart_txd_in <= '0'; wait for 8.68 us;   -- start bit
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;    
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '1'; wait for 8.68 us;   -- stop bit
        
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1';
        
        
        
        
        
        uart_txd_in <= '1'; wait for 1500 us; 
        
        uart_txd_in <= '0'; wait for 8.68 us;   -- start bit
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;    
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us; 
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;    
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us; 
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us;   -- stop bit
        uart_txd_in <= '0'; wait for 8.68 us;   -- start bit 
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;    
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us; 
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us;   -- stop bit
        uart_txd_in <= '0'; wait for 8.68 us;   -- start bit  
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;    
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us; 
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;    
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us; 
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us;   -- stop bit
        uart_txd_in <= '0'; wait for 8.68 us;   -- start bit     
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;    
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us;   -- stop bit
        uart_txd_in <= '0'; wait for 8.68 us;   -- start bit   
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;    
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us;   -- stop bit
        uart_txd_in <= '0'; wait for 8.68 us;   -- start bit 
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;    
        uart_txd_in <= '0'; wait for 8.68 us; uart_txd_in <= '0'; wait for 8.68 us;
        uart_txd_in <= '1'; wait for 8.68 us;   -- stop bit
        
        uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait for 8.68 us; uart_txd_in <= '1'; wait;
    end process;

button : process
begin
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 800us;

	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '1'; 
	button_in(3) <= '0'; wait for 100us;
	
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 100us;
	
    button_in(0) <= '1'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 100us;
	
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 100us;
	
	button_in(0) <= '0'; 	
	button_in(1) <= '1';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 100us;
	
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 100us;
	
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '1'; wait for 100us;
	
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 100us;
	
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '1'; 
	button_in(3) <= '0'; wait for 100us;
	
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 100us;

	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '1'; 
	button_in(3) <= '0'; wait for 100us;
	
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 1500us;
	
	
	
	
	
	
	
   	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 400us;

	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '1'; 
	button_in(3) <= '0'; wait for 100us;
	
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 100us;
	
    button_in(0) <= '1'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 100us;
	
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 100us;
	
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '1'; wait for 100us;
	
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 100us;
	
	button_in(0) <= '1'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 100us;
	
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 100us;
	
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '1'; 
	button_in(3) <= '0'; wait for 100us;
	
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait for 100us;

	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '1'; 
	button_in(3) <= '0'; wait for 100us;    
	
	button_in(0) <= '0'; 	
	button_in(1) <= '0';
	button_in(2) <= '0'; 
	button_in(3) <= '0'; wait;


	
	
end process button;

end architecture str;

