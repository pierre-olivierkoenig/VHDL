LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity UAL_TB IS

END UAL_TB ;


architecture BENCH of UAL_TB is
	signal A, B : std_logic_vector(31 downto 0);
	signal OP   : std_logic_vector (1 downto 0);
	signal N    : std_logic;
	signal Y    : std_logic_vector(31 downto 0);
	
begin
	process
	begin
		for i in 0 to 31 loop
			for j in 0 to 31 loop
				for k in 0 to 3 loop
					A <= std_logic_vector(to_unsigned(i,32));
					B <= std_logic_vector(to_unsigned(j,32));
					OP <= std_logic_vector(to_unsigned(k,2));
					wait for 10 ns;
					if OP="01" then 
						assert Y=B report "ERROR ON op==1 UAL" severity warning;
					elsif OP="11" then 
						assert Y=A report "ERROR ON op==2 UAL" severity warning;
					elsif OP="00" then 
						assert signed(Y) = signed(A)+signed(B) report "ERROR on addition UAL" severity warning;
						if (signed(A)+signed(B)) > 0 then
							assert N = '0' report "ERROR N VALUE IS WRONG ON UAL OP == 00" severity warning;
						else
							assert N = '1' report "ERROR N VALUE IS WRONG ON UAL" severity warning;
						end if;
					elsif OP="10" then
						assert signed(Y) = signed(A)-signed(B) report "ERROR on addition UAL" severity warning;
						if (signed(A)-signed(B)) > 0 then
							assert N = '0' report "ERROR N VALUE IS WRONG ON UAL" severity warning;
						else
							assert N = '1' report "ERROR N VALUE IS WRONG ON UAL OP == 10" severity warning;
						end if;
					end if;
				end loop;
			end loop;	
		end loop;		
		report "End of test. Verify that no error was reported.";
		wait;
	end process;
	
UUT : entity work.UAL
port map (A=> A, B=> B, OP=>OP, 
           N => N, Y => Y);
end BENCH;