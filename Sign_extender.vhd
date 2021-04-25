LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity SIGN is
generic (N :integer);
port ( E : in STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	   S : out std_logic_vector (31 downto 0));
end entity;
		
architecture dataflow of SIGN is
begin
	process(E)
	begin
		S(N - 1 downto 0) <= E;
		for I in N to 31 loop
			S(I) <= E(N-1);
		end loop;
	end process;
end architecture;	