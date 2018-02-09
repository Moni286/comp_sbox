----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:08:19 02/08/2018 
-- Design Name: 
-- Module Name:    gf24_square - Behavioral 
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

entity gf24_square is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end gf24_square;

architecture Behavioral of gf24_square is

begin
	
	q(3) <= d(3);
	q(2) <= d(3) XOR d(2);
	q(1) <= d(2) XOR d(1);
	q(0) <= d(3) XOR d(1) XOR d(0);

end Behavioral;

