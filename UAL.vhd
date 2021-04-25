LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity UAL is
port ( A : in STD_LOGIC_VECTOR(31 DOWNTO 0) := X"00000000";
	   B : in STD_LOGIC_VECTOR (31 DOWNTO 0):= X"00000000";
	   OP : in std_logic_vector (1 downto 0):= "00";
	   N : out std_logic := '0';
	   Y : out std_logic_vector (31 downto 0):= X"00000000");
end entity;

architecture dataflow of UAL is
begin
	N <= '0';
	process (A, B, OP)
	begin
	case OP is
		when "00" => Y <= std_logic_vector(signed(A) + signed(B));
		if ((signed(A) + signed(B)) < 0) then 
			N <= '1'; 
		end if;
		when "01" => Y <= B;
		when "10" => Y <= std_logic_vector(signed(A) - signed(B));
		if ((signed(A) - signed(B)) < 0) then 
			N <= '1';
		end if;
		when "11" => Y <= A;
		when others => Y <= (others => 'Z');
	end case;
	end process;

end architecture;	