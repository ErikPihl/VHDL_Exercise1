-----------------------------------------------------------------------------------------
-- Modulen Exercise1_tb används som testbänk för modulen Exercise1_tb, som består av 
-- tre insignaler switch[2:0] samt två utsignaler led[1:0]. Sanningstabellen för modulen 
-- Exercise1 visas nedan:
--
-- switch[2:0]   led[1:0]
--    000           00
--    001           01  
--    010           00
--    011           11
--    100           00
--    101           11
--    110           10
--    111           11
--
-- I denna testbänk deklareras signaler med samma namn som toppmodulens I/O-portar. 
-- Varje kombination av insignaler switch[2:0] testas en efter en under 10 ns, där 
-- utsignaler led[1:0] kontrolleras via simulering i ModelSim.
-----------------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Exercise1_tb is
end entity;

architecture Behaviour of Exercise1_tb is

signal switch : std_logic_vector(2 downto 0); -- Simulerade insignaler.
signal led    : std_logic_vector(1 downto 0); -- Simulerade utsignaler.

---------------------------------------------------------------------------------
-- Deklarerar toppmodulen Exercise1 för att kunna skapa en instans av denna,
-- vilket möjliggör sammankoppling av dess I/O-portar med simulerade signaler 
-- med samma namn för simulering.
---------------------------------------------------------------------------------
component Exercise1 is
   port
   (
      switch : in std_logic_vector(2 downto 0); -- Insignaler från slide-switchar.
      led    : out std_logic_vector(1 downto 0) -- Utsignaler till lysdioder.
   );
end component;

begin

   ---------------------------------------------------------------------------------
   -- Sammankopplar toppmodulens I/O-portar med signaler med samma namn i testbänken
   -- för simulering via port mapping. En instans av toppmdolen Exercise1 döpt
   -- Exercise1_instance deklareras för att möjliggöra sammankopplingen.
   ---------------------------------------------------------------------------------
   Exercise1_instance: Exercise1 port map
   (
      switch => switch,
      led    => led
   );
   
   ---------------------------------------------------------------------------------
   -- Implementererar en process för att simulera samtliga kombinationer 000 - 111
   -- av insignaler switch[2:0] var 10:e ns. Simulering genomförs under 80 ns.
   ---------------------------------------------------------------------------------
   process is
   begin
      for i in 0 to 7 loop
         switch <= std_logic_vector(to_unsigned(i, 3));
         wait for 10 ns;
      end loop;
      wait;
   end process;

end architecture;