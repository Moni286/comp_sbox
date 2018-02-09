----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:46:07 02/08/2018 
-- Design Name: 
-- Module Name:    affine_transformation - Behavioral 
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

entity affine_transformation is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0));
end affine_transformation;

architecture Behavioral of affine_transformation is

begin

	q(7) <= (d(3) XOR d(4) XOR d(5) XOR d(6) XOR d(7));
	q(6) <= NOT (d(2) XOR d(3) XOR d(4) XOR d(5) XOR d(6));
	q(5) <= NOT (d(1) XOR d(2) XOR d(3) XOR d(4) XOR d(5));
	q(4) <= (d(0) XOR d(1) XOR d(2) XOR d(3) XOR d(4));
	q(3) <= (d(7) XOR d(0) XOR d(1) XOR d(2) XOR d(3));
	q(2) <= (d(6) XOR d(7) XOR d(0) XOR d(1) XOR d(2));
	q(1) <= NOT (d(5) XOR d(6) XOR d(7) XOR d(0) XOR d(1));
	q(0) <= NOT (d(4) XOR d(5) XOR d(6) XOR d(7) XOR d(0));
	
end Behavioral;

