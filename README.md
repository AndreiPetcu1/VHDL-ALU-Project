# VHDL ALU Project
This project implements a 2-bit Arithmetic Logic Unit (ALU) on a Basys 3 FPGA board, using VHDL in the Vivado Design Suite. The ALU accepts two 2-bit operands (A and B) and performs arithmetic operations—addition,
subtraction, multiplication, and division—based on a 3-bit OPCODE input. The result is shown via a 7-segment display, and the binary output is also assigned to the board’s LEDs for easy monitoring. Special care is
taken to handle division by zero, which triggers an error state. The project was synthesized and tested using Vivado, targeting the xc7a35tcpg236-1 FPGA chip. The VHDL architecture is cleanly structured into two
processes: one for performing arithmetic based on OPCODE, and another for converting the 4-bit result into a 7-segment encoding. Proper I/O mapping was handled via a constraint file. This educational design
showcases the power of programmable logic, digital arithmetic, and hardware description languages, serving as an excellent foundation for learning FPGA-based ALU design.
