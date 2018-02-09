----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:35:18 02/09/2018 
-- Design Name: 
-- Module Name:    whole_box - Behavioral 
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

entity whole_box is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0));
end whole_box;

architecture Behavioral of whole_box is

COMPONENT affine_transformation is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT affine_transformation;

COMPONENT mult_inv is
    Port ( clk : in STD_LOGIC;
			  d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT mult_inv;

signal after_trans : STD_LOGIC_VECTOR(7 downto 0);

begin
	
	affTrans : affine_transformation PORT MAP(d, after_trans);
	multInv : mult_inv PORT MAP('1', after_trans, q);
	
end Behavioral;





