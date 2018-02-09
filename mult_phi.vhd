----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:41 02/09/2018 
-- Design Name: 
-- Module Name:    mult_phi - Behavioral 
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

entity mult_phi is
    Port ( d : in  STD_LOGIC_VECTOR (1 downto 0);
           q : out  STD_LOGIC_VECTOR (1 downto 0));
end mult_phi;

architecture Behavioral of mult_phi is

begin
--	not sure about order

	q(0) <= d(1);
	q(1) <= d(0) XOR d(1);

end Behavioral;

