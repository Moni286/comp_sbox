----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:16:02 02/08/2018 
-- Design Name: 
-- Module Name:    mult_inv - Behavioral 
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

entity mult_inv is
    Port ( clk : in STD_LOGIC;
			  d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0));
end mult_inv;

architecture Behavioral of mult_inv is

COMPONENT iso_mapping is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q0 : out  STD_LOGIC_VECTOR (3 downto 0);
			  q1 : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT iso_mapping;

COMPONENT gf24_square is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT gf24_square;

COMPONENT x_lambda is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT x_lambda;

signal nibble0 : STD_LOGIC_VECTOR(3 downto 0);
signal nibble1 : STD_LOGIC_VECTOR(3 downto 0);
signal after_square : STD_LOGIC_VECTOR(3 downto 0);
signal after_lambda : STD_LOGIC_VECTOR(3 downto 0);

begin

	nibble0 <= d(3 downto 0);
	nibble1 <= d(7 downto 4);
	
	iso : iso_mapping PORT MAP(d, nibble0, nibble1);
	x2 : gf24_square PORT MAP(nibble1, after_square);
	xLambda : x_lambda PORT MAP(after_square, after_lambda);
	
end Behavioral;





