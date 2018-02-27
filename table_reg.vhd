library ieee;
use ieee.std_logic_1164.all;


entity table_reg is port(
	
	-- INPUTS
	clock: in std_logic;
	reset: in std_logic;
	write_enable: in std_logic;
	input_addr: in std_logic_vector(47 downto 0);
	input_location: in std_logic_vector(4 downto 0);
	read_location: in std_logic_vector(4 downto 0);
	
	-- OUTPUTS
	output_addr: out std_logic_vector(47 downto 0)
	);
	
end table_reg;

architecture table_reg_arch of table_reg is

	begin -- the arch
	
	process (clock) begin
		for i in 0 to 31 loop
			if write_enable = '1' then
				
			end if;
		end loop;
	end process;
	
	
end table_reg_arch;

