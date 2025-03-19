library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_2bit_display is
    Port ( A : in STD_LOGIC_VECTOR(1 downto 0);
           B : in STD_LOGIC_VECTOR(1 downto 0);
           operation : in STD_LOGIC_VECTOR(2 downto 0);
           sevenSegmentDisplay : out STD_LOGIC_VECTOR(6 downto 0));
end ALU_2bit_display;

architecture Behavioral of ALU_2bit_display is
    signal result : STD_LOGIC_VECTOR(3 downto 0);
begin
    process(A, B, operation)
    variable temp_product : STD_LOGIC_VECTOR(3 downto 0);
    begin
     temp_product := (others => '0');
        case operation is
        when "000" =>
                temp_product := ('0' &'0' & A) + ('0' &'0' & B);  -- Adunare
            when "001" =>
                temp_product := ('0' &'0' & A) - ('0' &'0' & B);  -- Sc?dere
            when "010" =>
                temp_product := ( A) * ( B);  -- Înmul?ire
            when "011" =>
                if B /= "00" then
                    temp_product :=STD_LOGIC_VECTOR(TO_UNSIGNED((TO_INTEGER(UNSIGNED('0' &'0' & A)) / TO_INTEGER(UNSIGNED('0' &'0' & B))), 4)); -- Împ?r?ire
                else
                    temp_product := "0000";  -- Seteaz? la zero în caz de împ?r?ire la zero
                end if;
            when others =>
                temp_product := "0000";
        end case;
        result<=temp_product;
    end process;

    process(result)
    begin
        case result is
            when "0000" =>
                sevenSegmentDisplay <= "1000000";  -- 0
            when "0001" =>
                sevenSegmentDisplay <= "1111001";  -- 1
            when "0010" =>
                sevenSegmentDisplay <= "0100100";  -- 2
            when "0011" =>
                sevenSegmentDisplay <= "0110000";  -- 3
            when "0100" =>
                sevenSegmentDisplay <= "0011001";  -- 4
            when "0101" =>
                sevenSegmentDisplay <= "0010010";  -- 5
            when "0110" =>
                sevenSegmentDisplay <= "0000010";  -- 6
            when "0111" =>
                sevenSegmentDisplay <= "1111000";  -- 7
            when "1000" =>
                sevenSegmentDisplay <= "0000000";  -- 8
            when "1001" =>
                sevenSegmentDisplay <= "0010000";  -- 9
            when others =>
                sevenSegmentDisplay <= "1111111";  -- Afi?eaz? ceva pentru alte rezultate
        end case;
    end process;
end Behavioral;