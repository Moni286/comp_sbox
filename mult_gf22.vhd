----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:27:14 02/09/2018 
-- Design Name: 
-- Module Name:    mult_gf22 - Behavioral 
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

entity mult_gf22 is
    Port ( d0 : in  STD_LOGIC_VECTOR (1 downto 0);
           d1 : in  STD_LOGIC_VECTOR (1 downto 0);
           q : out  STD_LOGIC_VECTOR (1 downto 0));
end mult_gf22;

architecture Behavioral of mult_gf22 is

begin
	
	q(1) <= ((d0(0) XOR d0(1)) AND (d1(0) XOR d1(1))) XOR (d0(0) AND d1(0));
	q(0) <= (d0(1) AND d1(1)) XOR (d0(0) AND d1(0));

end Behavioral;

