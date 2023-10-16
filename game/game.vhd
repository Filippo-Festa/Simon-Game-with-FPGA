-- IDEA
-- include difficulty (easy, medium, hard) with a rising number of elements to remember <- use the switches to chose the difficulty

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
use work.newtype.all;


entity game is
	port(pattern_input : in matrix;
	     valid_in      : in std_logic;         -- from receiver
	
	     rst           : in std_logic;
	     clock         : in std_logic;
	     button_in     : in std_logic_vector(3 downto 0);	
	
	     led           : out std_logic_vector(3 downto 0) := (others => '0');  
	     led_red       : out std_logic_vector(3 downto 0) := (others => '0');
	     led_green     : out std_logic_vector(3 downto 0) := (others => '0');
	     led_level     : out std_logic_vector(3 downto 0) := (others => '0');
	
	     valid_out   : out std_logic := '0';              -- to transmitter
	     to_transmit    : out std_logic_vector(7 downto 0));
end entity game;



architecture rtl of game is

component edge_detector is
	Port (sig   : in std_logic;
	      clk   : in std_logic;
	      edge  : out std_logic); 
end component; 


type state_t is (waiting, S0, Detect);
signal state : state_t := waiting;

signal slow_clk       : std_logic;
signal counter        : unsigned(27 downto 0) := (others => '0');
signal enable_counter : std_logic := '0';

signal level : integer := 0;

signal valid_pattern : std_logic := '0';    -- from showing led to play the game


signal button_in0_detect   : std_logic;    -- button detection variables       
signal button_in1_detect   : std_logic;
signal button_in2_detect   : std_logic;
signal button_in3_detect   : std_logic;
signal edge_detect_buttons : std_logic;

signal slow_clk_detect : std_logic;

signal rst_detect : std_logic;



begin 

-- set the edge detectors
edge_detect_slow_clk   : edge_detector port map(sig => slow_clk, clk => clock, edge => slow_clk_detect);
edge_detect_rst        : edge_detector port map(sig => rst, clk => clock, edge => rst_detect);

edge_detect_button_in0 : edge_detector port map(sig => button_in(0), clk => clock, edge => button_in0_detect);
edge_detect_button_in1 : edge_detector port map(sig => button_in(1), clk => clock, edge => button_in1_detect);
edge_detect_button_in2 : edge_detector port map(sig => button_in(2), clk => clock, edge => button_in2_detect);
edge_detect_button_in3 : edge_detector port map(sig => button_in(3), clk => clock, edge => button_in3_detect);

edge_detect_buttons  <=  button_in0_detect xor button_in1_detect xor button_in2_detect xor button_in3_detect;


    p_clk: process (clock) is
        begin
        if rising_edge(clock) then
        
        	if valid_in = '1' then
        		enable_counter <= '1';
            end if;
            		
            if enable_counter = '1' then
                counter <= counter + 1;
            end if;
            
            if valid_pattern = '1' then
                enable_counter <= '0';
                counter <= (others => '0');          		
            end if;
            
        end if;	 
    end process;
    
    slow_clk <= counter(27-level);
     
    
    
    p_led : process (clock) is  
    variable i : integer := 0;    
      
    begin
    	if rising_edge(clock) then	
    	    valid_pattern <= '0';
    	    
    	    if slow_clk_detect = '1' then   	          
                if i < 6 then
                    led <= pattern_input(i);
                    i := i+1;	    
                elsif i = 6 then
                    led <= (others => '0');                                             
                    valid_pattern <= '1';
                    i := 0;
                end if;
    	    end if;	
    	end if;
    end process;
    
    
    
    
    main : process (clock) is
    variable i : integer := 0; 
               
    begin
    
    if rising_edge(clock) then
    
        if rst_detect = '1' then  -- slow clock detection
            state <= Detect;      -- restart game => new try
            level <= 0;
            i := 0;
            
            to_transmit <= "11111111";   -- get new sequence 
            valid_out   <= '1';	
            led_green <= (others => '0');
            led_red   <= (others => '0');
            led_level <= (others => '0');
                
         else
            case state is
                
                   when waiting =>
                        if valid_pattern = '1' then
                            i := 0;
                            state <= S0;
                        end if;
                        
                        if valid_in = '1' then
                            led_green <= (others => '0');
                            led_red   <= (others => '0');
                        end if;
                            
                    when S0 =>
                    	
                    	if edge_detect_buttons = '1' then                          -- button push detection
		                    if button_in = pattern_input(i) then
		                       if i = 5 then                                  
		                            if level = 3 then
		                                to_transmit <= "00000000"; -- end of game
		                            else
		                                to_transmit <= "11111111"; -- new sequence
		                            end if;
		                            
		                            valid_out <= '1';
		                            led_green <= (others => '1');
		                            level <= level + 1;
		                            state     <= Detect; 
		                       else	
		                            i := i+1;
		                       end if;
		                    else
		                        to_transmit <= "00000000";          -- end of game
		                        valid_out   <= '1';
		                        led_red <= (others => '1');
		                        state       <= Detect;
		                    end if;
		          end if;                                                   
                        
                    when Detect =>
                    	 	                       
                        if level = 1 then
                            led_level(0) <= '1';
                        elsif level = 2 then
                            led_level(1) <= '1';
                        elsif level = 3 then
                            led_level(2) <= '1';
                        elsif level = 4 then
                            led_level(3) <= '1';
                        end if;
                        
                        valid_out <= '0';
                        state <= waiting;
                        
                    when others => null; 
    
                end case;
            end if;
        end if;
    end process main;

end architecture rtl;
