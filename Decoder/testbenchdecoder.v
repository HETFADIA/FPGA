module test_bench();
    reg [31:0] tb_mem [0:10];
    reg [1:0] control_tb;//11 => data load; 00 => right shift; 01 => left shift; 10 => retain;
    reg clk;
    initial clk = 0;
    always 
        begin
        #10 clk = ~clk;
        end
    reg [2:0] decoder_input_tb;
    wire [7:0] out_decoder_tb;
    universal_shift_register ins(.decoder_input(decoder_input_tb),.control(control_tb),.clock(clk),.out_decoder(out_decoder_tb),.serial_input(serial_input_tb));
    initial 
        begin 
            $readmemh("configure.mem",tb_mem);
            ins.ins1.mem = {1'b0, tb_mem[3]};
            ins.ins2.mem = {1'b0, tb_mem[4]};
            ins.ins3.mem = {1'b0, tb_mem[5]};
            ins.ins4.mem = {1'b0, tb_mem[6]};
            ins.ins5.mem = {1'b0, tb_mem[7]};
            ins.ins6.mem = {1'b0, tb_mem[8]};
            ins.ins7.mem = {1'b0, tb_mem[9]};
            ins.ins8.mem = {1'b0, tb_mem[10]};
            
            decoder_input_tb=3'b000;
            #20 $display("%b",out_decoder_tb);

            decoder_input_tb=3'b001;
            #20 $display("%b",out_decoder_tb);

            decoder_input_tb=3'b010;
            #20 $display("%b",out_decoder_tb);

            decoder_input_tb=3'b011;
            #20 $display("%b",out_decoder_tb);

            decoder_input_tb=3'b100;
            #20 $display("%b",out_decoder_tb);

            decoder_input_tb=3'b101;
            #20 $display("%b",out_decoder_tb);

            decoder_input_tb=3'b110;
            #20 $display("%b",out_decoder_tb);

            decoder_input_tb=3'b111;
            #20 $display("%b",out_decoder_tb);
        
            
        
        end
    initial 
        #250 $finish;

    initial
        begin
        $dumpfile("ha.vcd");
        $dumpvars;      
        end
  
endmodule
