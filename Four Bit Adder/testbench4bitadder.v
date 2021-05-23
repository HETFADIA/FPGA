module test_bench();
  reg [31:0] tb_mem [0:12];
  reg [1:0] control_tb;//11 => data load; 00 => right shift; 01 => left shift; 10 => retain;
  reg clk;
  initial clk = 0;
  always 
    begin
      #10 clk = ~clk;
    end
  reg serial_input_tb;//0=>parallel input; 1=>serial input;
  reg [3:0] four_bits_one_tb;
  reg [3:0] four_bits_two_tb;
  reg cin_tb;
  wire [3:0] four_bits_sum_tb;
  wire cout_tb;
  
//   universal_shift_register ins(.four_bits_one(four_bits_one_tb),.four_bits_two(four_bits_two_tb),.cin(cin_tb),.control(control_tb),.clock(clk),.four_bits_sum(four_bits_sum_tb),.serial_input(serial_input_tb),.cout(cout_tb));
  universal_shift_register ins(four_bits_one_tb,four_bits_two_tb,cin_tb,control_tb,clock,four_bits_sum_tb,serial_input_tb,cout_tb);
  initial 
    begin 
      
      $readmemh("configure.mem",tb_mem);
      ins.ins1.mem = {1'b0, tb_mem[11]};
      ins.ins2.mem = {1'b0, tb_mem[11]};
      ins.ins3.mem = {1'b0, tb_mem[11]};
      ins.ins4.mem = {1'b0, tb_mem[11]};
      ins.ins5.mem = {1'b0, tb_mem[12]};
      ins.ins6.mem = {1'b0, tb_mem[12]};
      ins.ins7.mem = {1'b0, tb_mem[12]};
      ins.ins8.mem = {1'b0, tb_mem[12]};

      four_bits_one_tb=4'b1111;
      four_bits_two_tb=4'b0101;
      cin_tb=1'b1;
      #20 $display("%b %b",four_bits_sum_tb,cout_tb);

      four_bits_one_tb=4'b1111;
      four_bits_two_tb=4'b0101;
      cin_tb=1'b0;
      #20 $display("%b %b",four_bits_sum_tb,cout_tb);

      four_bits_one_tb=4'b1000;
      four_bits_two_tb=4'b0101;
      cin_tb=1'b1;
      #20 $display("%b %b",four_bits_sum_tb,cout_tb);

      four_bits_one_tb=4'b1000;
      four_bits_two_tb=4'b0101;
      cin_tb=1'b0;
      #20 $display("%b %b",four_bits_sum_tb,cout_tb);

      four_bits_one_tb=4'b1000;
      four_bits_two_tb=4'b1111;
      cin_tb=1'b0;
      #20 $display("%b %b",four_bits_sum_tb,cout_tb);

      four_bits_one_tb=4'b1000;
      four_bits_two_tb=4'b1111;
      cin_tb=1'b1;
      #20 $display("%b %b",four_bits_sum_tb,cout_tb);
      
    end
  
  initial 
      #250 $finish;
 
  initial
    begin
      $dumpfile("ha.vcd");
      $dumpvars;      
    end
  
endmodule
