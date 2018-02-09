----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:12:31 02/08/2018 
-- Design Name: 
-- Module Name:    x_lambda - Behavioral 
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

entity x_lambda is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end x_lambda;

architecture Behavioral of x_lambda is

signal d2xord0 : STD_LOGIC;

begin
	d2xord0 <= d(2) XOR d(0);
	
	q(3) <= d2xord0;
	q(2) <= d(3) XOR d(1) XOR d2xord0;
	q(1) <= d(3);
	q(0) <= d(2);
	
end Behavioral;

