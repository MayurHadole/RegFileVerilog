/*File          : REGFILE.v 
--Group         : Group 8
--Programmers   : Mayur Hadole
--Version       : 1.0  (May 17 , 2017)
--Hardware used : Cyclone V (DE1 SoC)
--Software used : Quartus II 15 64 bit
--Description   : This program implements CPU's register file on DE1 SoC board using VHDL

-- code is working and is tested on board

*/
module REGFILE(clk,ASEL,BSEL,DSEL,DIN,RIN,A,B);    //Module names and I/o pins are declared
input clk;
input [2:0] ASEL;                                   //Bus Selection (Input)
input [2:0] BSEL;												 //Bus Selection (Input)
input [2:0] DSEL;												 //Destination Select (Input)
input [7:0] DIN;												 //Input Data (Input)
input [7:0] RIN;												 //Destination Register data In (Input)

output [7:0] A;												 //BUS Outputs
output [7:0] B;												 //BUS Outputs

reg [7:0] A;			// 8 Bit output register
reg [7:0] B;         // 8 Bit output register

// 7 8-bit registers for the CPU
reg [7:0] reg1;
reg [7:0] reg2;
reg [7:0] reg3;
reg [7:0] reg4;
reg [7:0] reg5;
reg [7:0] reg6; 
reg [7:0] reg7;

always @(posedge clk)    //always block loop to execute over and over again
begin
	case (DSEL)             // Depending upon the register number mentioned in DSEL input line , data is transfered from that RIN to the particular register
		3'b001 : reg1 = RIN;
		3'b010 : reg2 = RIN;
		3'b011 : reg3 = RIN;
		3'b100 : reg4 = RIN;
		3'b101 : reg5 = RIN;
		3'b110 : reg6 = RIN;
		3'b111 : reg7 = RIN;
	endcase;
end
	
always @(ASEL)       //always block loop to execute over and over again
	begin
	case (ASEL)            // Depending upon the register number mentioned in ASEL input line , data is transfered from that particular register to the output line A
	   3'b000 : A = DIN;   // if ASEL is zero then DIN is directly transfered to Ouput line A
		3'b001 : A = reg1;
		3'b010 : A = reg2;
		3'b011 : A = reg3;
		3'b100 : A = reg4;
		3'b101 : A = reg5;
		3'b110 : A = reg6;
		3'b111 : A = reg7;
	endcase;
end
	
	always @(BSEL)      //always block loop to execute over and over again
	begin
	case (BSEL)           //Depending upon the register number mentioned in BSEL input line , data is transfered from that particular register to the output line B
		3'b000 : B = DIN;  // if BSEL is zero then DIN is directly transfered to Ouput line B
		3'b001 : B = reg1;
		3'b010 : B = reg2;
		3'b011 : B = reg3;
		3'b100 : B = reg4;
		3'b101 : B = reg5;
		3'b110 : B = reg6;
		3'b111 : B = reg7;
	endcase;
end
endmodule
	
	

