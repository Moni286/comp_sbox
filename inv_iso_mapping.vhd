----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:02:08 02/08/2018 
-- Design Name: 
-- Module Name:    inv_iso_mapping - Behavioral 
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

entity inv_iso_mapping is
    Port ( d0 : in  STD_LOGIC_VECTOR (3 downto 0);
			  d1 : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0));
end inv_iso_mapping;

architecture Behavioral of inv_iso_mapping is

begin

	q(7) <= d1(3) XOR d1(2) XOR d1(1) XOR d0(1);
	q(6) <= d1(2) XOR d0(2);
	q(5) <= d1(2) XOR d1(1) XOR d0(1);
	q(4) <= d1(2) XOR d1(1) XOR d1(0) XOR d0(2) XOR d0(1);
	q(3) <= d1(1) XOR d1(0) XOR d0(3) XOR d0(2) XOR d0(1);
	q(2) <= d1(3) XOR d1(0) XOR d0(3) XOR d0(2) XOR d(01);
	q(1) <= d1(1) XOR d1(0);
	q(0) <= d1(2) XOR d1(1) XOR d1(0) XOR d0(2) XOR d0(0);

end Behavioral;

