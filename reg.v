`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CEET
// Engineer: Venkatesh H
// 
// Create Date: 22.02.2024 21:32:20
// Design Name: EE6361 - Assignment -1 
// Module Name: RegisterMemory
// Project Name: EE6361 - Assignment -1 
// 
//////////////////////////////////////////////////////////////////////////////////
/*Declares a module named "RegisterMemory" with the module's ports
*clk: Clock 
*reset: Reset Signal
*address: 5-bit address bus (Number of bits: range_end – range_start + 1)
*wr_en: Write enable 
*rd_en: Read enable 
*data_in: 8-bit data input bus*/

module RegisterMemory(address,write_en,read_en,data_in,data_out,flag_reg);

input read_en;
input write_en;
input [4:0] address; //5 bit address 
input [7:0] data_in; //8 bit data bus
output reg [7:0] data_out; //8 bit data bus
output reg [3:0] flag_reg;
reg [7:0] registers [31:0]; //8-bit wide register array named registers with 32 elements
always @(*) begin
  if (write_en) //write enabled
    registers[address] <= data_in; //data_in value into the register address with Non-blocking assignment
  else if (read_en) // read enbled
    data_out = registers[address]; //Value from register address into data_out with Non-blocking assignment
  end
  if (reset) begin
      // Initialize the flag register to 4'b0 during reset
      flag_reg <= 4'b0;
  end

endmodule


