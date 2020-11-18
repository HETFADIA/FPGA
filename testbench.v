module test_bench();
  reg [31:0] tb_mem [0:9];
  reg [1:0] control_tb;//11 => data load; 00 => right shift; 01 => left shift; 10 => retain;
  reg c2_tb;
  reg clk;
  initial clk = 0;
  always 
    begin
      #10 clk = ~clk;
    end
  reg serial_input_tb;//0=>parallel input; 1=>serial input;
  reg [7:0] data_load_tb;
  wire [7:0] lab5_output;
  universal_shift_register ins(.data_load(data_load_tb),.control(control_tb),.clock(clk),.out_final(lab5_output),.serial_input(serial_input_tb),.c2(c2_tb));
  initial 
    begin 
      
      $readmemh("configure.mem",tb_mem);
      ins.inst1.configure = tb_mem[9];//0001
      ins.inst2.configure = tb_mem[8];//0011
      ins.inst3.configure = tb_mem[8];
      ins.inst4.configure = tb_mem[8];
      ins.inst5.configure = tb_mem[8];
      ins.inst6.configure = tb_mem[8];
      ins.inst7.configure = tb_mem[8];
      ins.inst8.configure = tb_mem[8];
      ins.inst9.configure = tb_mem[8];
      ins.ins1.mem = {1'b0, tb_mem[0]};
      ins.ins2.mem = {1'b0, tb_mem[0]};
      ins.ins3.mem = {1'b0, tb_mem[0]};
      ins.ins4.mem = {1'b0, tb_mem[0]};
      ins.ins5.mem = {1'b0, tb_mem[0]};
      ins.ins6.mem = {1'b0, tb_mem[0]};
      ins.ins7.mem = {1'b0, tb_mem[0]};
      ins.ins8.mem = {1'b0, tb_mem[0]};

      ins.ins9.mem =  {1'b0, tb_mem[1]};
      ins.ins10.mem = {1'b0, tb_mem[1]};
      ins.ins11.mem = {1'b0, tb_mem[1]};
      ins.ins12.mem = {1'b0, tb_mem[1]};
      ins.ins13.mem = {1'b0, tb_mem[1]};
      ins.ins14.mem = {1'b0, tb_mem[1]};
      ins.ins15.mem = {1'b0, tb_mem[1]};
      ins.ins16.mem = {1'b0, tb_mem[1]};

      
      ins.ins17.mem = {1'b0, tb_mem[0]}; 
      ins.ins18.mem = {1'b0, tb_mem[1]}; 
      ins.ins19.mem = {1'b0, tb_mem[2]}; 
      ins.ins20.mem = {1'b0, tb_mem[3]}; 
      ins.ins21.mem = {1'b0, tb_mem[4]}; 
      ins.ins22.mem = {1'b0, tb_mem[5]}; 
      ins.ins23.mem = {1'b0, tb_mem[6]}; 
      ins.ins24.mem = {1'b0, tb_mem[7]}; 

      data_load_tb    = 8'b10101100;
      control_tb      = 2'b11;
      serial_input_tb = 1'b0;
      c2_tb=1'b1;
      #20 $display("Output is : %b",lab5_output);   
      c2_tb=1'b0;
      #20 $display("Output is : %b",lab5_output);   
      control_tb      = 2'b10;
      serial_input_tb = 1'b0;
      c2_tb=1'b1;
      #20 $display("Output is : %b",lab5_output);   
      c2_tb=1'b0;
      #20 $display("Output is : %b",lab5_output);   
      control_tb      = 2'b01;
      serial_input_tb = 1'b0;
      c2_tb=1'b1;
      #20 $display("Output is : %b",lab5_output);   
      c2_tb=1'b0;
      #20 $display("Output is : %b",lab5_output);   
      control_tb      = 2'b00;
      serial_input_tb = 1'b0;
      c2_tb=1'b1;
      #20 $display("Output is : %b",lab5_output);   
      c2_tb=1'b0;
      #20 $display("Output is : %b",lab5_output);   
    end
  
  initial 
      #250 $finish;
 
  initial
    begin
      $dumpfile("ha.vcd");
      $dumpvars;      
    end
  
endmodule