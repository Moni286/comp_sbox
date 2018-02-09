----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:07:02 02/09/2018 
-- Design Name: 
-- Module Name:    inv_gf24 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inv_gf24 is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end inv_gf24;

architecture Behavioral of inv_gf24 is

begin

	q(3) <= d(3) XOR (d(3) AND d(2) AND d(1)) XOR
		(d(3) AND d(0)) XOR d(2);
		
	q(2) <= (d(3) AND d(2) AND d(1)) XOR 
		(d(3) AND d(2) AND d(0)) XOR 
		(d(3) AND d(0)) XOR d(2) XOR 
		(d(2) AND d(1));
	
	q(1) <= d(3) XOR (d(3) AND d(2) AND d(1)) XOR 
		(d(3) AND d(1) AND d(0)) XOR 
		d(2) XOR (d(2) AND d(0)) XOR d(1);
	
	q(0) <= (d(3) AND d(2) AND d(1)) XOR 
		(d(3) AND d(2) AND d(0)) XOR 
		(d(3) AND d(1)) XOR 
		(d(3) AND d(1) AND d(0)) XOR 
		(d(3) AND d(0)) XOR
		d(2) XOR (d(2) AND d(1)) XOR 
		(d(2) AND d(1) AND d(0)) XOR
		d(1) XOR d(0);

end Behavioral;

