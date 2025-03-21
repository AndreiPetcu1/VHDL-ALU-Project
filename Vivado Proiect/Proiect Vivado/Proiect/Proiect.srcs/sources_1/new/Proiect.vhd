library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Proiect is
    Port ( A : in STD_LOGIC_VECTOR(1 downto 0);
           B : in STD_LOGIC_VECTOR(1 downto 0);
           reset: in boolean;
           operatie : in STD_LOGIC_VECTOR(2 downto 0);
           segment : out STD_LOGIC_VECTOR(6 downto 0));
end Proiect;

architecture Behavioral of Proiect is
    signal C : STD_LOGIC_VECTOR(3 downto 0);
begin
    process(A, B, operatie,reset)
    begin
        case operatie is
        when "000" =>
                C <= ('0' &'0' & A) + ('0' &'0' & B);  -- Adunare
            when "001" =>
                C <= ('0' &'0' & A) - ('0' &'0' & B);  -- Sc?dere
            when "010" =>
                C <= (A) * (B);  -- �nmul?ire
            when "011" =>
                if B /= "00" then
                    C <=STD_LOGIC_VECTOR(TO_UNSIGNED((TO_INTEGER(UNSIGNED('0' &'0' & A)) / TO_INTEGER(UNSIGNED('0' &'0' & B))), 4)); -- �mp?r?ire
                else
                    C <= "0000";  -- Seteaz? la zero �n caz de �mp?r?ire la zero
                end if;
            when others =>
                C <= "0000";
        end case;
    end process;

    process(C)
    begin
        case C is
            when "0000" =>
                segment <= "1000000";  -- 0
            when "0001" =>
                segment <= "1111001";  -- 1
            when "0010" =>
                segment <= "0100100";  -- 2
            when "0011" =>
                segment <= "0110000";  -- 3
            when "0100" =>
                segment <= "0011001";  -- 4
            when "0101" =>
                segment <= "0010010";  -- 5
            when "0110" =>
                segment <= "0000010";  -- 6
            when "0111" =>
                segment <= "1111000";  -- 7
            when "1000" =>
                segment <= "0000000";  -- 8
            when "1001" =>
                segment <= "0010000";  -- 9
            when others =>
                segment <= "1111111";  -- Afi?eaz? ceva pentru alte rezultate
        end case;
        
        case reset is
        when TRUE=>
        segment<="1111111";
        when FALSE=>
        end case;
    end process;
end Behavioral;