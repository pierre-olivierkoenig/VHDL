LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity Register_UAL is
	port ( RA : in STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
		   RB : in STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
		   RW : in STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
		   WE :in std_logic := '0';
		   RST : in STD_LOGIC := '0';
		   CLK : in STD_LOGIC := '0';
		   OP : in STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
		   N : out STD_LOGIC := '0');
end entity;

architecture COMP of Register_UAL is

	signal W, A, B : STD_LOGIC_VECTOR(31 DOWNTO 0);
	begin
		G1 : entity WORK.REGISTE port map(RST => RST, CLK => CLK, WE => WE, 
		RA => RA, RB => RB, RW => RW,
		A => A, B => B, W => W);
		G2 : entity WORK.UAL port map (A => A, B => B, OP => OP, N => N, Y => W);
end architecture;

--					REGISTE
--CLK , RST, WE: in std_logic;
--	W : in STD_LOGIC_VECTOR(31 DOWNTO 0);
--	RA, RB : in STD_LOGIC_VECTOR(3 DOWNTO 0);
--	RW : in STD_LOGIC_VECTOR(3 DOWNTO 0);
--	A, B : out STD_LOGIC_VECTOR(31 DOWNTO 0));

--  				UAL 
-- A : in STD_LOGIC_VECTOR(31 DOWNTO 0);
-- B : in STD_LOGIC_VECTOR (31 DOWNTO 0);
-- OP : in std_logic_vector (1 downto 0);
-- N : out std_logic;
-- Y : out std_logic_vector (31 downto 0));