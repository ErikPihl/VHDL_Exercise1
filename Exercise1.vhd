-----------------------------------------------------------------------------------------
-- Modulen Exercise1 används för att realisera ett system bestående av tre insignaler
-- switch[2:0] samt två utsignaler led[1:0]. Sanningstabellen för modulen visas nedan:
--
-- switch[2:0]   led[1:0]
--    000           00
--    001           01  
--    010           01
--    011           10
--    100           01
--    101           10
--    110           10
--    111           11
--
-----------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity Exercise1 is
   port
   (
      switch : in std_logic_vector(2 downto 0); -- Insignaler från slide-switchar.
      led    : out std_logic_vector(1 downto 0) -- Utsignaler till lysdioder.
   );
end entity;

architecture Behaviour of Exercise1 is
begin

   ---------------------------------------------------------------------------------
   -- Sanningstabellen för modulen Exercise1 realiseras via en case-sats. Ifall
   -- insignalerna är odefinierade så nollställs utsignalerna. 
   ---------------------------------------------------------------------------------
   process (switch) is
   begin
      case (switch) is
         when "000"  => led <= "00";
         when "001"  => led <= "01";
         when "010"  => led <= "01";
         when "011"  => led <= "10";
         when "100"  => led <= "01";
         when "101"  => led <= "10";
         when "110"  => led <= "10";
         when "111"  => led <= "11";
         when others => led <= "00";
      end case;
   end process;
   
end architecture;