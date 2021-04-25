LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity REGISTER_UAL_TB IS

END REGISTER_UAL_TB;

architecture BENCH of REGISTER_UAL_TB is
type table is array(15 downto 0) of std_logic_vector(31 downto 0);
	SIGNAL RA, RB : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
	SIGNAL	   RW : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
	SIGNAL	   WE, RST, CLK: STD_LOGIC := '0';
	SIGNAL	   OP : STD_LOGIC_VECTOR(1 DOWNTO 0) := "11";
	SIGNAL	   N : STD_LOGIC;

begin	

	process
	begin
		RA <= "1111";
		RB <= "1111";
		wait for 10 ns;

		WE <= '1';
		CLK <= '1';
		--step1 Write R(1) = R(15)
		wait for 10 ns;
		WE <= '0';
		RA <= "0001";
		OP <= "00";
		
		
		CLK <= '0';
		--step2 setup W bus
		wait for 10 ns;
		CLK <= '1';
		--Write R(1) = R(1) + R(15)
		wait for 10 ns;
		CLK <= '0';
		RW <= "0010";
		wait for 10 ns;
		CLK <= '1';
		WE <= '1';
		--Write (R2) = R(1) + R(15)
		wait for 10 ns;
		CLK <= '0';
		
		RW <= "0011";
		OP <= "10";
		
		wait for 10 ns;
		CLK <= '1';
		--Write (R3) = R(1) - R(15)
		
		wait for 10 ns;
		
		CLK <= '0';
		
		RW <= "0101";
		RA <= "0111";
		OP <= "10";
		wait for 10 ns;
		CLK <= '1';
		--Write (R5) = R(7) - R(15)
		wait for 10 ns;
	end process;
	
UUT : entity work.Register_UAL
port map (RA => RA, RB => RB, RW => RW, WE => WE, RST => RST, CLK => CLK, OP => OP, N => N);
end BENCH;


--	R(1) = R(15)
--  R(1) = R(1) + R(15)
--  R(2) = R(1) + R(15)
--  R(3) = R(1) - R(15)
--  R(5) = R(7) - R(15)

