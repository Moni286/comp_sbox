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

COMPONENT inv_gf24 is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT inv_gf24;

COMPONENT x_lambda is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT x_lambda;

COMPONENT mult_gf24 is
    Port ( d0 : in  STD_LOGIC_VECTOR (3 downto 0);
           d1 : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT mult_gf24;

COMPONENT inv_iso_mapping is
    Port ( d0 : in  STD_LOGIC_VECTOR (3 downto 0);
			  d1 : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT inv_iso_mapping;

signal nibble0 : STD_LOGIC_VECTOR(3 downto 0);
signal nibble1 : STD_LOGIC_VECTOR(3 downto 0);
signal after_square : STD_LOGIC_VECTOR(3 downto 0);
signal after_lambda : STD_LOGIC_VECTOR(3 downto 0);

signal after_mult0 : STD_LOGIC_VECTOR(3 downto 0);
signal after_inv : STD_LOGIC_VECTOR(3 downto 0);

signal after_mult1 : STD_LOGIC_VECTOR(3 downto 0);
signal after_mult2 : STD_LOGIC_VECTOR(3 downto 0);

begin
	
	iso : iso_mapping PORT MAP(d, nibble0, nibble1);
	x2 : gf24_square PORT MAP(nibble1, after_square);
	xLambda : x_lambda PORT MAP(after_square, after_lambda);
	
	mult0 : mult_gf24 PORT MAP(nibble0 XOR nibble1, nibble0, after_mult0);
	invGF24 : inv_gf24 PORT MAP(after_lambda XOR after_mult0, after_inv);
	
	mult1 : mult_gf24 PORT MAP(nibble1, after_inv, after_mult1);
	mult2 : mult_gf24 PORT MAP(after_inv, nibble0 XOR nibble1, after_mult2);
	
	inv_iso : inv_iso_mapping PORT MAP(after_mult2, after_mult1, q);
	
end Behavioral;









