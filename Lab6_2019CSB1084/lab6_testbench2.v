module test_bench();
  reg [31:0] tb_mem [0:11];
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
  wire [7:0] lab6_output;
  universal_shift_register ins(.data_load(data_load_tb),.control(control_tb),.clock(clk),.out_final(lab6_output),.serial_input(serial_input_tb),.c2(c2_tb));
  initial 
    begin 
      
      $readmemh("lab6_configure2.mem",tb_mem);
      ins.inst1.configure = tb_mem[9];//0001
      ins.inst2.configure = tb_mem[8];//0011
      ins.inst3.configure = tb_mem[8];
      ins.inst4.configure = tb_mem[8];
      ins.inst5.configure = tb_mem[8];
      ins.inst6.configure = tb_mem[8];
      ins.inst7.configure = tb_mem[8];
      ins.inst8.configure = tb_mem[8];
      ins.inst9.configure = tb_mem[8];
      ins.inst10.configure = tb_mem[10];//0004
      ins.inst11.configure = tb_mem[10];
      ins.inst12.configure = tb_mem[10];
      ins.inst13.configure = tb_mem[10];
      ins.inst14.configure = tb_mem[11];
      ins.inst15.configure = tb_mem[11];
      ins.inst16.configure = tb_mem[11];
      ins.inst17.configure = tb_mem[11];

      ins.ins1.mem = {1'b0, tb_mem[0]};//00000001 they are useless in decoder
      ins.ins2.mem = {1'b0, tb_mem[0]};
      ins.ins3.mem = {1'b0, tb_mem[0]};
      ins.ins4.mem = {1'b0, tb_mem[0]};
      ins.ins5.mem = {1'b0, tb_mem[0]};
      ins.ins6.mem = {1'b0, tb_mem[0]};
      ins.ins7.mem = {1'b0, tb_mem[0]};
      ins.ins8.mem = {1'b0, tb_mem[0]};

      ins.ins9.mem =  {1'b0, tb_mem[1]};//00000008 they are useless in decoder
      ins.ins10.mem = {1'b0, tb_mem[1]};
      ins.ins11.mem = {1'b0, tb_mem[1]};
      ins.ins12.mem = {1'b0, tb_mem[1]};
      ins.ins13.mem = {1'b0, tb_mem[1]};
      ins.ins14.mem = {1'b0, tb_mem[1]};
      ins.ins15.mem = {1'b0, tb_mem[1]};
      ins.ins16.mem = {1'b0, tb_mem[1]};

      
      ins.ins17.mem = {1'b0, tb_mem[0]}; //00000001
      ins.ins18.mem = {1'b0, tb_mem[1]}; //00000008
      ins.ins19.mem = {1'b0, tb_mem[2]}; //00000010
      ins.ins20.mem = {1'b0, tb_mem[3]}; //00000080
      ins.ins21.mem = {1'b0, tb_mem[4]}; //00000100
      ins.ins22.mem = {1'b0, tb_mem[5]}; //00000800
      ins.ins23.mem = {1'b0, tb_mem[6]}; //00001000
      ins.ins24.mem = {1'b0, tb_mem[7]}; //00008000

      data_load_tb    = 8'b10101100;
      serial_input_tb = 1'b0;


      control_tb[0]      = 1'b1;
      control_tb[1]      = 1'b1;
      c2_tb=1'b1;
      #20 $display("Output is : %b",lab6_output);   

      control_tb[0]      = 1'b1;
      control_tb[1]      = 1'b1;
      c2_tb=1'b0;
      #20 $display("Output is : %b",lab6_output);   

      control_tb[0]      = 1'b0;
      control_tb[1]      = 1'b1;
      c2_tb=1'b1;
      #20 $display("Output is : %b",lab6_output);   

      control_tb[0]      = 1'b0;
      control_tb[1]      = 1'b1;
      c2_tb=1'b0;
      #20 $display("Output is : %b",lab6_output); 

      control_tb[0]      = 1'b1;
      control_tb[1]      = 1'b0;
      c2_tb=1'b1;
      #20 $display("Output is : %b",lab6_output); 

      control_tb[0]      = 1'b1;
      control_tb[1]      = 1'b0;  
      c2_tb=1'b0;
      #20 $display("Output is : %b",lab6_output);  

      control_tb[0]      = 1'b0;
      control_tb[1]      = 1'b0;
      c2_tb=1'b1;
      #20 $display("Output is : %b",lab6_output);   

      control_tb[0]      = 1'b0;
      control_tb[1]      = 1'b0;
      c2_tb=1'b0;
      #20 $display("Output is : %b",lab6_output);   
    end
  
  initial 
      #250 $finish;
 
  initial
    begin
      $dumpfile("ha2.vcd");
      $dumpvars;      
    end
  
endmodule