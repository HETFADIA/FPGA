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
  wire [7:0] lab5_output;
  universal_shift_register ins(.data_load(data_load_tb),.control(control_tb),.clock(clk),.out_final(lab5_output),.serial_input(serial_input_tb));
  initial 
    begin 
      
      $readmemh("lab5_configure.mem",tb_mem);
      ins.inst1.configure = tb_mem[13];//0001
      ins.inst2.configure = tb_mem[14];//0011
      ins.inst3.configure = tb_mem[14];
      ins.inst4.configure = tb_mem[14];
      ins.inst5.configure = tb_mem[14];
      ins.inst6.configure = tb_mem[14];
      ins.inst7.configure = tb_mem[14];
      ins.inst8.configure = tb_mem[14];
      ins.inst9.configure = tb_mem[14];
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

      
      ins.ins17.mem = {1'b1, tb_mem[2]}; 
      ins.ins18.mem = {1'b1, tb_mem[2]}; 
      ins.ins19.mem = {1'b1, tb_mem[2]}; 
      ins.ins20.mem = {1'b1, tb_mem[2]}; 
      ins.ins21.mem = {1'b1, tb_mem[2]}; 
      ins.ins22.mem = {1'b1, tb_mem[2]}; 
      ins.ins23.mem = {1'b1, tb_mem[2]}; 
      ins.ins24.mem = {1'b1, tb_mem[2]}; 

      data_load_tb    = 8'b10101100;
      control_tb      = 2'b11;//load_data;
      serial_input_tb = 1'b0;
      #20 $display("Output is : %b",lab5_output);

      data_load_tb    = 8'b11001001;
      control_tb      = 2'b10;//retain;
      serial_input_tb = 1'b0;
      #20 $display("Output is : %b",lab5_output);

      data_load_tb    = 8'b11001001;
      control_tb      = 2'b11;//load_data;
      serial_input_tb = 1'b0;
      #20 $display("Output is : %b",lab5_output);

      data_load_tb    = 8'b11001001;
      control_tb      = 2'b00;//right shift;
      serial_input_tb = 1'b0;
      #20 $display("Output is : %b",lab5_output);
      $display("Serial output right is %b",lab5_output[0]);

      data_load_tb    = 8'b11001001;
      control_tb      = 2'b10;//retain;
      serial_input_tb = 1'b0;
      #20 $display("Output is : %b",lab5_output);

      data_load_tb    = 8'b11001001;
      control_tb      = 2'b01;//left shift;
      serial_input_tb = 1'b0;
      #20 $display("Output is : %b",lab5_output);
      $display("Serial output left is %b",lab5_output[7]);

      data_load_tb    = 8'b11001001;
      control_tb      = 2'b00;//right shift;
      serial_input_tb = 1'b1;
      #20 $display("Output is : %b",lab5_output);
      $display("Serial output right is %b",lab5_output[0]);

      data_load_tb    = 8'b11001001;
      control_tb      = 2'b01;//left shift;
      serial_input_tb = 1'b1;
      #20 $display("Output is : %b",lab5_output);
      $display("Serial output left is %b",lab5_output[7]);

      data_load_tb    = 8'b11110000;
      control_tb      = 2'b11;//load_data;
      serial_input_tb = 1'b0;
      #20 $display("Output is : %b",lab5_output);


      data_load_tb    = 8'b11001001;
      control_tb      = 2'b01;//left shift;
      serial_input_tb = 1'b0;
      #20 $display("Output is : %b",lab5_output);
      $display("Serial output left is %b",lab5_output[7]);

      data_load_tb    = 8'b11001001;
      control_tb      = 2'b10;//retain;
      serial_input_tb = 1'b0;
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