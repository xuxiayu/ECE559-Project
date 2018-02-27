library ieee;
use ieee.std_logic_1164.all;


entity interface_fsm is port(
	
	-- INPUTS
	clock: in std_logic;
	reset: in std_logic;
	input_port: in std_logic_vector(2 downto 0);
	match_found: in std_logic;
	lookup_complete: in std_logic;
	
	-- OUTPUTS
	input_rdy: out std_logic;
	output_rdy: out std_logic;
	dest_port: out std_logic_vector(2 downto 0)
	);
	
end interface_fsm;

architecture intf_arch of interface_fsm is

	type state_type is (state_reset, state_input, state_output);
	signal state_reg, state_next: state_type;
	
	begin -- the arch
	
	-- FSM
	process (clock, reset) begin
		if(reset = '1' ) then 
			state_reg <= state_reset;
		-- asynchronous reset
		elsif (clock'event and clock = '1') then
			state_reg <= state_next;
		elsif (clock'event and clock = '0') then
			if match_found = '1' then
				dest_port <= input_port;
			else
				dest_port <= "100";
			end if;
		end if;
		
	end process;
	
	process (state_reg, lookup_complete) begin
		case state_reg is 
		
			when state_reset => 
				input_rdy <= '1';
				output_rdy <= '0';
				if lookup_complete = '0' then
					state_next <= state_reset;
				else
					state_next <= state_input;
				end if;
				
			when state_input =>
				input_rdy <= '0';
				output_rdy <= '0';
				state_next <= state_output;
				
			when state_output =>
				input_rdy <= '0';
				output_rdy <= '1';
				state_next <= state_reset;
				
		end case;
	end process;
end intf_arch;