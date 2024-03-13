`timescale 1ns/1ps

module Testbench;
 reg read_en;
 reg write_en;
 reg [4:0] address;
 reg [7:0] data_in;
 wire [7:0] data_out;

  // Instantiate the RegisterMemory module
  RegisterMemory REG(address,write_en,read_en,data_in,data_out);

  // Initializations
  initial begin
    address=0; //address setting to zero
    // Test Case 1: Load values into registers
    #10;
    write_en = 1;
    address = 5'b0100; // R4
    data_in = 8'b10001101; // 141
    #10;
    write_en = 0;

    #10;
    write_en = 1;
    address = 5'b0110; // R6
    data_in = 8'b11010000; // 208
    #10;
    write_en = 0;

    #10;
    write_en = 1;
    address = 5'b1000; // R8
    data_in = 8'b00100000; // 32
    #10;
    write_en = 0;

    // Test Case 2: Move values across registers
    #10;
    read_en = 1;
    address = 5'b0100; // R4
    #10;
    read_en = 0;

    #10;
    write_en = 1;
    address = 5'b0101; // R5
    data_in = data_out;
    #10;
    write_en = 0;

    #10;
    read_en = 1;
    address = 5'b1000; // R8
    #10;
    read_en = 0;

    #10;
    write_en = 1;
    address = 5'b1001; // R9
    data_in = data_out;
    #10;
    write_en = 0;

    #10;
    read_en = 1;
    address = 5'b0110; // R6
    #10;
    read_en = 0;

    #10;
    write_en = 1;
    address = 5'b0111; // R7
    data_in = data_out;
    #10;
    write_en = 0;

    // Test Case 3: R4 + R6 => R10, check R10 and check if Carry
    #10;
    write_en = 1;
    address = 5'b1010; // R10
    data_in = 8'b0;
    #10;
    write_en = 0;
    read_en = 1;
    address = 5'b0100; // R4
    #10;
    read_en = 0;
    read_en = 1;
    address = 5'b0110; // R6
    #10;
    ead_en = 0;

    // Test Case 4: R6 –R8 => R11, check R11 and check if Borrow
    #10 write_en = 1;
    address = 5'b1011; // R11
    data_in = 8'b0;
    #10 write_en = 0;
    read_en = 1;
    address = 5'b0110; // R6
    #10 read_en = 0;
    read_en = 1;
    address = 5'b1000; // R8
    #10 read_en = 0;

    // Test Case 5: R8 − R4 => R12, check R12 and check if Borrow
    #10 write_en = 1;
    address = 5'b1100; // R12
    data_in = 8'b0;
    #10 write_en = 0;
    read_en = 1;
    address = 5'b1000; // R8
    #10 read_en = 0;
    read_en = 1;
    address = 5'b0100; // R4
    #10 read_en = 0;

    // Test Case 6: INC R12, check R12
    #10 write_en = 1;
    address = 5'b1100; // R12
    data_in = 8'b0;
    #10 write_en = 0;
    read_en = 1;
    address = 5'b1100; // R12
    #10 read_en = 0;

    // Test Case 7: R4 ≥ R6? check the flag
    #10 read_en = 1;
    address = 5'b0100; // R4
    #10 read_en = 0;
    read_en = 1;
    address = 5'b0110; // R6
    #10 read_en = 0;

    // Test Case 8: R4 − R4 => R13, check R13 and check zero flag
    #10 write_en = 1;
    address = 5'b1101; // R13
    data_in = 8'b0;
    #10 write_en = 0;
    read_en = 1;
    address = 5'b0100; // R4
    #10 read_en = 0;
    read_en = 1;
    address = 5'b0100; // R4
    #10 read_en = 0;

    // Test Case 9: Add the numbers with carry using a Loop and store in R13
    #10 write_en = 1;
    address = 5'b1101; // R13
    data_in = 8'b0;
    #10 write_en = 0;
    read_en = 1;
    address = 5'b0100; // R4
    #10 read_en = 0;
    read_en = 1;
    address = 5'b0101; // R5
    #10 read_en = 0;
    read_en = 1;
    address = 5'b0110; // R6
    #10 read_en = 0;
    read_en = 1;
    address = 5'b0111; // R7
    #10 read_en = 0;
    read_en = 1;
    address = 5'b1000; // R8
    #10 read_en = 0;
    read_en = 1;
    address = 5'b1001; // R9
    #10 read_en = 0;

    // Test Case 10: Find the largest number in R4, R5, R6, R8, R9, R10 and store in R13, check R13
    #10 write_en = 1;
    address = 5'b1101; // R13
    data_in = 8'b0;
    #10 write_en = 0;
    read_en = 1;
    address = 5'b0100; // R4
    #10 read_en = 0;
    read_en = 1;
    address = 5'b0101; // R5
    #10 read_en = 0;
    read_en = 1;
    address = 5'b0110; // R6
    #10 read_en = 0;
    read_en = 1;
    address = 5'b1000; // R8
    #10 read_en = 0;
    read_en = 1;
    address = 5'b1001; // R9
    #10 read_en = 0;
    read_en = 1;
    address = 5'b1010; // R10
    #10 read_en = 0;

    // // ... Continue with other test cases ...

    // $finish; // End simulation after all test cases

    // // ... Continue with other test cases ...

    // $finish; // End simulation after all test cases

    // endmodule



    $finish; // End simulation after all test cases
  end

endmodule

