
-------------------------------------------------------
-- Logicko projektovanje racunarskih sistema 1
-- 2011/2012,2020
--
-- Data RAM
--
-- author:
-- Ivan Kastelan (ivan.kastelan@rt-rk.com)
-- Milos Subotic (milos.subotic@uns.ac.rs)
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity data_ram is
	port(
		iCLK  : in  std_logic;
		inRST : in  std_logic;
		iA    : in  std_logic_vector(7 downto 0);
		iD    : in  std_logic_vector(15 downto 0);
		iWE   : in  std_logic;
		oQ    : out std_logic_vector(15 downto 0)
	);
end entity data_ram;

architecture Behavioral of data_ram is

	type tMEM is array(0 to 255) of std_logic_vector(15 downto 0);
	signal rMEM : tMEM;
	signal sMEM : tMEM := (others => x"0000");

begin

	process(iCLK, inRST)
	begin
		if inRST = '0' then
			for i in 0 to 255 loop
				rMEM(i) <= sMEM(i);
			end loop;
		elsif rising_edge(iCLK) then
			if iWE = '1' then
				rMEM(conv_integer(iA)) <= iD;
			end if;
		end if;
	end process;
-- ubaciti sadrzaj *.dat datoteke generisane pomocu lprsasm ------
sMEM(0) <= x"0006";
sMEM(1) <= x"0000";
sMEM(2) <= x"004b";
sMEM(3) <= x"0100";
sMEM(4) <= x"0140";
sMEM(5) <= x"0200";
sMEM(6) <= x"0003";
sMEM(7) <= x"0007";
sMEM(8) <= x"0005";
sMEM(9) <= x"0000";
sMEM(10) <= x"0004";
sMEM(11) <= x"0000";
sMEM(12) <= x"000a";
sMEM(13) <= x"0008";
sMEM(14) <= x"ffff";
sMEM(15) <= x"ffff";
sMEM(16) <= x"0005";
sMEM(17) <= x"0002";
sMEM(18) <= x"0007";
sMEM(19) <= x"0003";
sMEM(20) <= x"0002";
sMEM(21) <= x"0007";
------------------------------------------------------------------
	
	oQ <= rMEM(conv_integer(iA));

end Behavioral;
