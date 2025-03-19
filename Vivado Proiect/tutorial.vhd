library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_UNSIGNED.ALL;
    use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (  A : in STD_LOGIC_VECTOR (7 downto 0);
            B : in STD_LOGIC_VECTOR (7 downto 0);
            OPCODE_SUMA : in boolean;
            OPCODE_DIFERENTA : in boolean;
            OPCODE_INMULTIRE : in boolean;
            OPCODE_IMPARTIRE : in boolean;
            OPCODE_RESET : in boolean;
            rezultat: out STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is
begin
    process(A, B, OPCODE_SUMA, OPCODE_DIFERENTA, OPCODE_INMULTIRE, OPCODE_IMPARTIRE, OPCODE_RESET)
    begin
        case(OPCODE_SUMA) is
            when TRUE => --adunare
                rezultat <= A + B;
            when others => NULL;
        end case;
        case(OPCODE_DIFERENTA) is
            when TRUE => --scadere
                rezultat <=  A - B;
            when others => NULL;
        end case;
        case(OPCODE_INMULTIRE) is
            when TRUE => --inmultire
                rezultat <= STD_LOGIC_VECTOR(TO_UNSIGNED((TO_INTEGER(UNSIGNED(A)) * TO_INTEGER(UNSIGNED(B))), 8));
            when others => NULL;
        end case;
        case(OPCODE_IMPARTIRE) is
            when TRUE => --impartire
                rezultat <= STD_LOGIC_VECTOR(TO_UNSIGNED((TO_INTEGER(UNSIGNED(A)) / TO_INTEGER(UNSIGNED(B))), 8));
            when others => NULL;
        end case;
        case(OPCODE_RESET) is
            when TRUE =>
                rezultat <= "00000000";
            when others => NULL;
        end case;
    end process;
end Behavioral;