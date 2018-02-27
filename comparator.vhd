library ieee;
use ieee.std_logic_1164.all;


entity comparator is port(

	-- INPUT
	input_addrA: in std_logic_vector(47 downto 0);
	input_addrB: in std_logic_vector(47 downto 0);
	
	-- OUTPUT
	match_found: out std_logic
	);
	
end comparator;

architecture comp_arch of comparator is 
	
	begin -- the arch
	
	process (input_addrA, input_addrB) begin
	
		if input_addrA = input_addrB then
			match_found <= '1';
		else
			match_found <= '0';
		end if;
		
	end process;
	
end comp_arch;



