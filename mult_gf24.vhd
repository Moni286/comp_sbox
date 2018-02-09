----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:52:21 02/09/2018 
-- Design Name: 
-- Module Name:    mult_gf24 - Behavioral 
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

entity mult_gf24 is
    Port ( d0 : in  STD_LOGIC_VECTOR (3 downto 0);
           d1 : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end mult_gf24;

architecture Behavioral of mult_gf24 is

COMPONENT mult_gf22 is
    Port ( d0 : in  STD_LOGIC_VECTOR (1 downto 0);
           d1 : in  STD_LOGIC_VECTOR (1 downto 0);
           q : out  STD_LOGIC_VECTOR (1 downto 0));
END COMPONENT mult_gf22;

COMPONENT mult_phi is
    Port ( d : in  STD_LOGIC_VECTOR (1 downto 0);
           q : out  STD_LOGIC_VECTOR (1 downto 0));
END COMPONENT mult_phi;

signal d0_nib0 : STD_LOGIC_VECTOR(1 downto 0);
signal d0_nib1 : STD_LOGIC_VECTOR(1 downto 0);
signal d1_nib0 : STD_LOGIC_VECTOR(1 downto 0);
signal d1_nib1 : STD_LOGIC_VECTOR(1 downto 0);

signal after_mult0 : STD_LOGIC_VECTOR(1 downto 0);
signal after_mult1 : STD_LOGIC_VECTOR(1 downto 0);
signal after_mult2 : STD_LOGIC_VECTOR(1 downto 0);

signal after_multphi : STD_LOGIC_VECTOR(1 downto 0);

begin
	
	d0_nib0 <= d0(1 downto 0);
	d0_nib1 <= d0(3 downto 2);
	d1_nib0 <= d1(1 downto 0);
	d1_nib1 <= d1(3 downto 2);
	
	mult0 : mult_gf22 PORT MAP(d0_nib1, d1_nib1, after_mult0);
	mult1 : mult_gf22 PORT MAP(d0_nib0 XOR d0_nib1, d1_nib0 XOR d1_nib1, after_mult1);
	mult2 : mult_gf22 PORT MAP(d0_nib0, d1_nib0, after_mult2);
	
	multPhi : mult_phi PORT MAP(after_mult0, after_multphi);
	
	q(3 downto 2) <= after_mult1 XOR after_mult2;
	q(1 downto 0) <= after_mult2 XOR after_multphi;
	
end Behavioral;




