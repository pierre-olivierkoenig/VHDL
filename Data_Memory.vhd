LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity MEMORY is
port (CLK , RST, WE: in std_logic;
	DataIn : in STD_LOGIC_VECTOR(31 DOWNTO 0);
	ADDR : in STD_LOGIC_VECTOR(5 DOWNTO 0);
	WrEn : in STD_LOGIC;
	DataOut : out STD_LOGIC_VECTOR(31 DOWNTO 0));
end entity;
		
architecture dataflow of MEMORY is
type table is array(63 downto 0) of std_logic_vector(31 downto 0);
function init_banc return table is
	variable result : table;
	begin
		for i in 62 downto 0 loop
			result(i) := (others=>'0');
		end loop;
		result(63):=X"00000030";
		return result;
end init_banc;

signal Banc: table:=init_banc;
begin
	DataOut <= Banc(To_integer(Unsigned(ADDR)));
	process(CLK)
	begin
		if rising_edge(CLK) and WrEn='1' then
			Banc(To_integer(Unsigned(ADDR))) <= DataIn;
		end if;
	end process;
	process (RST)
	begin
		if rising_edge(RST) then
			Banc <= init_banc;
		end if;
	end process;
end architecture;	