LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity MUX_TB IS

END MUX_TB;

architecture BENCH of MUX_TB is
	signal COM      : std_logic;
	signal A, B : std_logic_vector(31 downto 0);
	signal S      : std_logic_vector(31 downto 0);
--	signal S	  : std_logic_vector(16 downto 0) := "0000000000000000";
--	signal A, B   : std_logic_vector(16 downto 0) := "0000000000000000";
	
begin
	process
	begin
		A <= std_logic_vector(to_unsigned(25, 32));
		B <= std_logic_vector(to_unsigned(30, 32));
		COM <= '0';
		wait for 10 ns;
		assert S = std_logic_vector(to_unsigned(25, 32)) report "MUX BUGGED" severity warning;
		COM <= '1';
		wait for 10 ns;
		assert S = std_logic_vector(to_unsigned(30, 32)) report "MUX BUGGED" severity warning;
	end process;
	
UUT : entity work.MUX generic map (N => 32)
port map (COM => COM, A => A, B => B, S => S);
end BENCH;