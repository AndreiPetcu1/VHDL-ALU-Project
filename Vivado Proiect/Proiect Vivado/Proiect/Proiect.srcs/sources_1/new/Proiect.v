
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/08/2024 08:35:17 PM
// Design Name: 
// Module Name: Proiect
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Proiect is
port(
    A : in std_logic_vector(1 downto 0);
    B : in std_logic_vector(1 downto 0);
    C : out std_logic_vector(6 downto 0);
    opcode_plus : in boolean;
    opcode_minus : in boolean;
    opcode_inmultit : in boolean:
    opcode_impartit : in boolean;
    reset : in boolean
    );
 end Proiect;

arhitecture Behavioral of Proict is

begin
    process(A,B,opcode_plus,opcode_minus,opcode_inmultit,opcode_impartit,reset)
    begin
    
    case opcode_plus is
    when TRUE=>
    C<=A+B;
    when FALSE =>
    end case;
    
    case opcode_minus is
    when TRUE=>
    C<=A-B;
    when FALSE =>
    end case;
    
    case opcode_inmultit is
    when TRUE=>
    C<=A*B;
    when FALSE=>
    end case;
    
    case opcode_impartit is
    when TRUE=>
    C<=A/B;
    when FALSE=>
    end case;
    
    case reset is
    when TRUE=>
    C<="0000"
    when FALSE=>
    end case;
    
    end process;
end Behavioral;









