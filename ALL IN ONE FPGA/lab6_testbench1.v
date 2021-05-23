module test_bench();
  reg [31:0] tb_mem [0:14];
  reg [1:0] control_tb;//11 => data load; 00 => right shift; 01 => left shift; 10 => retain;
  reg clk;
  initial clk = 0;
  always 
    begin
      #10 clk = ~clk;
    end
  reg serial_input_tb;//0=>parallel input; 1=>serial input;
  reg [7:0] data_load_tb;
  wire [7:0] lab6_output;
  reg c2_tb;
  universal_shift_register ins(.data_load(data_load_tb),.control(control_tb),.clock(clk),.out_final(lab6_output),.serial_input(serial_input_tb),.c2(c2_tb));
  initial 
    begin 
      
      $readmemh("lab6_configure1.mem",tb_mem);
      ins.inst1.configure = tb_mem[13];//0000 for making it 0
      ins.inst2.configure = tb_mem[14];//0008 
      ins.inst3.configure = tb_mem[14];
      ins.inst4.configure = tb_mem[14];
      ins.inst5.configure = tb_mem[14];
      ins.inst6.configure = tb_mem[14];
      ins.inst7.configure = tb_mem[14];
      ins.inst8.configure = tb_mem[14];
      ins.inst9.configure = tb_mem[14];
      ins.inst10.configure = tb_mem[14];
      ins.inst11.configure = tb_mem[14];
      ins.inst12.configure = tb_mem[14];
      ins.inst13.configure = tb_mem[14];
      ins.inst14.configure = tb_mem[14];
      ins.inst15.configure = tb_mem[14];
      ins.inst16.configure = tb_mem[14];
      ins.inst17.configure = tb_mem[14];

      ins.ins1.mem = {1'b0, tb_mem[0]};//CCCCAAAA as they are useless
      ins.ins2.mem = {1'b0, tb_mem[0]};
      ins.ins3.mem = {1'b0, tb_mem[0]};
      ins.ins4.mem = {1'b0, tb_mem[0]};
      ins.ins5.mem = {1'b0, tb_mem[0]};
      ins.ins6.mem = {1'b0, tb_mem[0]};
      ins.ins7.mem = {1'b0, tb_mem[0]};
      ins.ins8.mem = {1'b0, tb_mem[0]};

      ins.ins9.mem =  {1'b0, tb_mem[1]};//FF00F0F0 as they are useless
      ins.ins10.mem = {1'b0, tb_mem[1]};
      ins.ins11.mem = {1'b0, tb_mem[1]};
      ins.ins12.mem = {1'b0, tb_mem[1]};
      ins.ins13.mem = {1'b0, tb_mem[1]};
      ins.ins14.mem = {1'b0, tb_mem[1]};
      ins.ins15.mem = {1'b0, tb_mem[1]};
      ins.ins16.mem = {1'b0, tb_mem[1]};

      
      ins.ins17.mem = {1'b0, tb_mem[2]};//FAFAA0A0 for carry
      ins.ins18.mem = {1'b0, tb_mem[2]}; 
      ins.ins19.mem = {1'b0, tb_mem[2]}; 
      ins.ins20.mem = {1'b0, tb_mem[2]}; 
      ins.ins21.mem = {1'b0, tb_mem[3]}; //A5A55A5A for sum
      ins.ins22.mem = {1'b0, tb_mem[3]}; 
      ins.ins23.mem = {1'b0, tb_mem[3]}; 
      ins.ins24.mem = {1'b0, tb_mem[3]}; 

      control_tb      = 2'b11;//load_data;
      serial_input_tb = 1'b1;




      data_load_tb[3:0]= 4'b0000;
      data_load_tb[7:4]= 4'b0011;
      c2_tb=1'b0;
      
      #20 $display("Sum is : %b Carry is %b",lab6_output[7:4],lab6_output[3]);
      
      data_load_tb[3:0]= 4'b0000;
      data_load_tb[7:4]= 4'b0011;
      c2_tb=1'b1;
      
      #20 $display("Sum is : %b Carry is %b",lab6_output[7:4],lab6_output[3]);
      
      data_load_tb[3:0]= 4'b0000;
      data_load_tb[7:4]= 4'b0000;
      c2_tb=1'b0;
      
      #20 $display("Sum is : %b Carry is %b",lab6_output[7:4],lab6_output[3]);
      
      data_load_tb[3:0]= 4'b0000;
      data_load_tb[7:4]= 4'b0000;
      c2_tb=1'b1;
      
      #20 $display("Sum is : %b Carry is %b",lab6_output[7:4],lab6_output[3]);
      
      
      data_load_tb[3:0]= 4'b0000;
      data_load_tb[7:4]= 4'b1111;
      c2_tb=1'b0;
      
      #20 $display("Sum is : %b Carry is %b",lab6_output[7:4],lab6_output[3]);
      
      data_load_tb[3:0]= 4'b0000;
      data_load_tb[7:4]= 4'b1111;
      c2_tb=1'b1;
      
      #20 $display("Sum is : %b Carry is %b",lab6_output[7:4],lab6_output[3]);
      
      
      data_load_tb[3:0]= 4'b0000;
      data_load_tb[7:4]= 4'b1010;
      c2_tb=1'b0;
      
      #20 $display("Sum is : %b Carry is %b",lab6_output[7:4],lab6_output[3]);
      
      data_load_tb[3:0]= 4'b0000;
      data_load_tb[7:4]= 4'b1010;
      c2_tb=1'b1;
      
      #20 $display("Sum is : %b Carry is %b",lab6_output[7:4],lab6_output[3]);
      
      data_load_tb[3:0]= 4'b1111;
      data_load_tb[7:4]= 4'b1010;
      c2_tb=1'b0;
      
      #20 $display("Sum is : %b Carry is %b",lab6_output[7:4],lab6_output[3]);
      
      data_load_tb[3:0]= 4'b1111;
      data_load_tb[7:4]= 4'b1010;
      c2_tb=1'b1;
      
      #20 $display("Sum is : %b Carry is %b",lab6_output[7:4],lab6_output[3]);
      
      data_load_tb[3:0]= 4'b1111;
      data_load_tb[7:4]= 4'b1111;
      c2_tb=1'b0;
      
      #20 $display("Sum is : %b Carry is %b",lab6_output[7:4],lab6_output[3]);
      
      data_load_tb[3:0]= 4'b1111;
      data_load_tb[7:4]= 4'b1111;
      c2_tb=1'b1;
      
      #20 $display("Sum is : %b Carry is %b",lab6_output[7:4],lab6_output[3]);
    end
  
  initial 
      #250 $finish;
 
  initial
    begin
      $dumpfile("ha1.vcd");
      $dumpvars;      
    end
  
endmodule