module logic_tile(out,clock,in1,in2,in3,in4,in5);
    input clock;
    input in1;
    input in2,in3,in4,in5;
    wire control;
    output out;
    reg [32:0] mem;
    reg q;
    reg qbar;
    wire d;

    initial begin
      q = 1'b0;
    end

    
    assign control=mem[32];
    assign d=mem[{in5,in4,in3,in2,in1}];
    always@(posedge clock)
        begin
            q <=d;
            qbar=!d;
        end


    assign out=(control & q) | (~control & d);
endmodule
module switch_box_4x4(out,in);
    input [3:0] in;
    reg [15:0] configure;
    output [3:0] out;
    assign out[0]= ((in[0] & configure[0]) | (in[1] & configure[1])) | ((in[2] & configure[2]) | (in[3] & configure[3]));
    assign out[1]= ((in[0] & configure[4]) | (in[1] & configure[5])) | ((in[2] & configure[6]) | (in[3] & configure[7]));
    assign out[2]= ((in[0] & configure[8]) | (in[1] & configure[9])) | ((in[2] & configure[10]) | (in[3] & configure[11]));
    assign out[3]= ((in[0] & configure[12]) | (in[1] & configure[13])) | ((in[2] & configure[14]) | (in[3] & configure[15]));
endmodule
module universal_shift_register(decoder_input,control,clock,out_decoder,serial_input);
    input [1:0] control;
    input serial_input;
    input clock;
    input [2:0] decoder_input;
    output [7:0] out_decoder;
    logic_tile ins1(.out(out_decoder[0]),.clock(clock),.in1(decoder_input[0]),.in2(decoder_input[1]),.in3(decoder_input[2]),.in4(1'b0),.in5(1'b0));
    logic_tile ins2(.out(out_decoder[1]),.clock(clock),.in1(decoder_input[0]),.in2(decoder_input[1]),.in3(decoder_input[2]),.in4(1'b0),.in5(1'b0));
    logic_tile ins3(.out(out_decoder[2]),.clock(clock),.in1(decoder_input[0]),.in2(decoder_input[1]),.in3(decoder_input[2]),.in4(1'b0),.in5(1'b0));
    logic_tile ins4(.out(out_decoder[3]),.clock(clock),.in1(decoder_input[0]),.in2(decoder_input[1]),.in3(decoder_input[2]),.in4(1'b0),.in5(1'b0));
    logic_tile ins5(.out(out_decoder[4]),.clock(clock),.in1(decoder_input[0]),.in2(decoder_input[1]),.in3(decoder_input[2]),.in4(1'b0),.in5(1'b0));
    logic_tile ins6(.out(out_decoder[5]),.clock(clock),.in1(decoder_input[0]),.in2(decoder_input[1]),.in3(decoder_input[2]),.in4(1'b0),.in5(1'b0));
    logic_tile ins7(.out(out_decoder[6]),.clock(clock),.in1(decoder_input[0]),.in2(decoder_input[1]),.in3(decoder_input[2]),.in4(1'b0),.in5(1'b0));
    logic_tile ins8(.out(out_decoder[7]),.clock(clock),.in1(decoder_input[0]),.in2(decoder_input[1]),.in3(decoder_input[2]),.in4(1'b0),.in5(1'b0));
    
endmodule
