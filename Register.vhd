LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity REGISTE is
port (CLK : in std_logic := '0';
	RST : IN STD_LOGIC := '0';
	WE : IN STD_LOGIC := '0';
	W : in STD_LOGIC_VECTOR(31 DOWNTO 0) := X"00000000";
	RA, RB : in STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	RW : in STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	A, B : out STD_LOGIC_VECTOR(31 DOWNTO 0):= X"00000000");
end entity;

architecture dataflow of REGISTE is
type table is array(15 downto 0) of std_logic_vector(31 downto 0);

-- code du prof
function init_banc return table is
	variable result : table;
	begin
		for i in 14 downto 0 loop
			result(i) := (others=>'0');
		end loop;
		result(15):=X"00000030";
		return result;
	end init_banc;
-- fin du code du prof

signal Banc: table:=init_banc;
begin
	A <= Banc(To_integer(Unsigned(RA)));
	B <= Banc(To_integer(Unsigned(RB)));
	process(CLK)
	begin
		if rising_edge(CLK) and WE='1' then
			Banc(To_integer(Unsigned(RW))) <= W;
		end if;
	end process;
	process (RST)
	begin
		if RST='1' then
			Banc <= init_banc;
		end if;
	end process;
end architecture;