use ieee.std_logic_1164.all;


entity interface_fsm is port(
	
	-- INPUTS
	clock: in std_logic;
	reset: in std_logic;
	input_port: in std_logic;
	match_found: in std_logic;
	lookup_complete: in std_logic;
	
	-- OUTPUTS
	input_rdy: out std_logic;
	output_rdy: out std_logic;
	dest_port: out std_logic(1 downto 0);
	
end fsm;

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
		-- synchronous state update
		end if;
	end process;
	
	process (state_reg, next_frame) begin
	
		when state_reset => 
			input_rdy <= '1';
			output_rdy <= '0';
			if lookup_complete = '0' then
				state_reg <= state_reset;
			else
				state_reg <= state_read;
			end if;
			
		when state_input =>
			input_rdy <= '0';
			output_rdy <= '0';
			state_reg <= state_write;
			
		when state_output =>
			input_rdy <= '0';
			output_rdy <= '1';
			state_reg <= reset_state;
			
	end process;
end intf_arch;