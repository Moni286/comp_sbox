----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:56:04 02/08/2018 
-- Design Name: 
-- Module Name:    iso_mapping - Behavioral 
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

entity iso_mapping is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q0 : out  STD_LOGIC_VECTOR (3 downto 0);
			  q1 : out  STD_LOGIC_VECTOR (3 downto 0));
end iso_mapping;

architecture Behavioral of iso_mapping is

begin
	
	q1(3) <= d(7) XOR d(5);
	q1(2) <= d(7) XOR d(6) XOR d(4) XOR d(3) XOR d(2) XOR d(1);
	q1(1) <= d(7) XOR d(5) XOR d(3) XOR d(2);
	q1(0) <= d(7) XOR d(5) XOR d(3) XOR d(2) XOR d(1);
	q0(3) <= d(7) XOR d(6) XOR d(2) XOR d(1);
	q0(2) <= d(7) XOR d(4) XOR d(3) XOR d(2) XOR d(1);
	q0(1) <= d(6) XOR d(4) XOR d(1);
	q0(0) <= d(6) XOR d(1) XOR d(0);

end Behavioral;

