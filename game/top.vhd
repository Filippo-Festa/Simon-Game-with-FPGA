library ieee;
use ieee.std_logic_1164.all;
use work.newtype.all;


entity top is

  port (
    rst          : in  std_logic;
    CLK100MHZ    : in  std_logic;
    button_in    : in std_logic_vector(3 downto 0);
    led          : out std_logic_vector(3 downto 0);
    led_red      : out std_logic_vector(3 downto 0);
    led_green    : out std_logic_vector(3 downto 0);
    led_level    : out std_logic_vector(3 downto 0);
    uart_txd_in  : in  std_logic;
    uart_rxd_out : out std_logic);

end entity top;

architecture str of top is
  signal valid_in       : std_logic;
  signal data_to_send   : std_logic_vector(7 downto 0);
  signal data_valid     : std_logic;
  signal busy           : std_logic;
  signal pattern_input  : matrix;

  
  

component game is
	port (
	pattern_input : in matrix;
	valid_in      : in std_logic;
	rst           : in std_logic;
	clock         : in std_logic;
	button_in     : in std_logic_vector(3 downto 0);	
	led           : out std_logic_vector(3 downto 0);
	led_red       : out std_logic_vector(3 downto 0);
	led_green     : out std_logic_vector(3 downto 0);
	led_level     : out std_logic_vector(3 downto 0);
	valid_out     : out std_logic;
	to_transmit   : out std_logic_vector(7 downto 0));
  end component game;	
	
  
  component uart_transmitter is
    port (
      clock         : in  std_logic;
      filtered_data : in  std_logic_vector(7 downto 0);
      data_valid    : in  std_logic;
      busy          : out std_logic;
      uart_tx       : out std_logic);
  end component uart_transmitter;

  component uart_receiver is
    port (
      clock          : in  std_logic;
      uart_rx        : in  std_logic;
      valid          : out std_logic;
      input_sequence : out matrix);
  end component uart_receiver;
  
  
begin  -- architecture str

  uart_receiver_1 : uart_receiver
    port map (
      clock          => CLK100MHZ,
      uart_rx        => uart_txd_in,
      valid          => valid_in,
      input_sequence => pattern_input);
      
  game_1 : game
    port map (
      pattern_input => pattern_input,
      valid_in      => valid_in,
      rst           => rst,
      clock         => CLK100MHZ,
      button_in     => button_in,	
      led           => led,
      led_red       => led_red,
      led_green     => led_green,
      led_level     => led_level,
      valid_out     => data_valid,
      to_transmit   => data_to_send);
      
      
  uart_transmitter_1 : uart_transmitter
    port map (
      clock         => CLK100MHZ,
      filtered_data => data_to_send,
      data_valid    => data_valid,
      busy          => busy,
      uart_tx       => uart_rxd_out);


end architecture str;
