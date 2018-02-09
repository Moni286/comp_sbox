-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY whole_box_tb IS
  END whole_box_tb;

  ARCHITECTURE behavior OF whole_box_tb IS 

  -- Component Declaration
          COMPONENT whole_box
          PORT(
                   d : in  STD_LOGIC_VECTOR (7 downto 0);
						 q : out  STD_LOGIC_VECTOR (7 downto 0)
                  );
          END COMPONENT;

          SIGNAL d :  std_logic_vector(7 downto 0);
          SIGNAL q :  std_logic_vector(7 downto 0);
          

  BEGIN

  -- Component Instantiation
          uut: whole_box PORT MAP(
                  d => d,
                  q => q
          );


  --  Test Bench Statements
     tb : PROCESS
     BEGIN

        wait for 100 ns; -- wait until global set/reset completes
			
		  d <= x"01";
		  
		  wait for 10 ns;
		  
		  d <= x"02";
		  
		  wait for 10 ns;
		  
		  d <= x"a3";

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
