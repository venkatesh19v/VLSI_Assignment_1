module Test_Bench;
 reg read_en;
 reg write_en;
 reg [4:0] address;
 reg [7:0] data_in;
 wire [7:0] data_out;

RegisterMemory REG(address,write_en,read_en,data_in,data_out);
initial read_en = 0; //initializing read enable to 0
initial write_en = 0; //initializing write enable to 0

initial begin
  //checking the git push
  address=0; //address setting to zero
  #15;
  address = 15; // Write to register 15
  write_en = 1; 
  data_in = 8'hF; // 15 - Hex "F" Data to be written  to register 15
  
  #15;
  write_en = 0; //Disabling write enable
  read_en = 1; //Enabling the read to read from register1 15
  
  #15;
  address = 22; // Move data from register 15 (F) to register 22
  read_en = 0; // Read enable
  write_en = 1; // Write enable
  data_in = data_out; // Move data from one register to another

  #15;
  write_en = 0; //Disabling write enable
  read_en = 1; //Read from register 15 to check the data
  
  #15;
  read_en = 0; //Disabling read enabled
  
  $finish;
  
end
endmodule


