LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity SIGN_TB IS

END SIGN_TB;

architecture BENCH of SIGN_TB is
	signal E : std_logic_vector(15 downto 0);
	signal S : std_logic_vector(31 downto 0);
begin
	process
	begin
		E <= std_logic_vector(to_unsigned(10, 16));
		wait for 10 ns;
		assert S = "00000000000000000000000000001010" report "SIGN POSITIV BUGGED" severity warning;
		E <= std_logic_vector(to_signed(-15,16));
		wait for 10 ns;
		assert S = std_logic_vector(to_signed(-15, 32)) report "SIGN  NEGATIV BUGGED" severity warning;
	end process;
	
UUT : entity work.SIGN generic map (N => 16)
port map (E => E, S => S);
end BENCH;