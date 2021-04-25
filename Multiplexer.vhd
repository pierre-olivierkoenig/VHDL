LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity MUX is
generic (N :integer);
port ( A, B: in STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	   COM : in std_logic;
	   S : out std_logic_vector (N-1 downto 0));
end entity;
		
architecture dataflow of MUX is
begin
	process (A, B, COM)
	begin
	case COM is
		when '0' => S <= A;
		when '1' => S <= B;
		when others => S <= (others => 'Z');
	end case;
	end process;

end architecture;	