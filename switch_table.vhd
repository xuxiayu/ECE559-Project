library ieee;
use ieee.std_logic_1164.all;


entity switch_table is port(

	-- INPUTS
	clock: in std_logic;
	reset: in std_logic;
	source_addr: in std_logic_vector(47 downto 0);
	source_port: in std_logic_vector(1 downto 0);
	dest_addr: in std_logic_vector(47 downto 0);
	dest_port: in std_logic_vector(1 downto 0);

	-- OUTPUTS
	input_rdy: out std_logic;
	output_rdy: out std_logic;
	broadcast: out std_logic
	);
	
end switch_table;

architecture table_arch of switch_table is
	
	-- INPUT SIGNALS, MIGHT NOT NEED
	signal SA: std_logic_vector(47 downto 0);
	signal SP: std_logic_vector(1 downto 0);
	signal DA: std_logic_vector(47 downto 0);
	signal DP: std_logic_vector(1 downto 0);
	
	-- TABLE SIGNALS
	signal table_addr: std_logic_vector(47 downto 0);
	signal table_port: std_logic_vector(1 downto 0);
	
	-- OTHER SIGNALS
	signal broadcast_sig: std_logic;
	signal match_found: std_logic;
	
	-- ENABLE SIGNALS
	signal write_enable: std_logic;
	
	-- STATE SIGNALS
	type state_type is (state_read, state_write, state_output);
	signal state_reg, state_next : state_type;
	
	
	-- Start the arch
	begin
	
	-- FSM
	process (clock, reset) begin
		if(reset = '1' ) then 
			state_reg <= state_read;
		-- asynchronous reset
		elsif (clock'event and clock = '1') then
			state_reg <= state_next;
		-- synchronous state update
		end if;
	end process;
	
	process (state_reg) begin
		case state_reg is
		
			when state_read =>
				SA <= source_addr;
				SP <= source_port;
				DA <= dest_addr;
				DP <= dest_port;
				
			when state_write =>
			
			when state_output =>
		
		end case;
	end process;
	
	
	
	
	

end table_arch;
	
	