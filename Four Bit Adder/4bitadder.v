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
module universal_shift_register(four_bits_one,four_bits_two,cin,control,clock,four_bits_sum,serial_input,cout);
    input [1:0] control;
    input serial_input;
    input clock;
    input cin;
    output [3:0] four_bits_sum;
    output cout;
    wire [7:0] out1,out2;
    input [3:0] four_bits_one;
    input [3:0] four_bits_two;
    wire [2:0] carry;
    logic_tile ins1(.out(carry[0]),.clock(clock),.in1(cin),.in2(four_bits_one[0]),.in3(four_bits_two[0]),.in4(1'b0),.in5(1'b0));
    logic_tile ins2(.out(carry[1]),.clock(clock),.in1(carry[0]),.in2(four_bits_one[1]),.in3(four_bits_two[1]),.in4(1'b0),.in5(1'b0));
    logic_tile ins3(.out(carry[2]),.clock(clock),.in1(carry[1]),.in2(four_bits_one[2]),.in3(four_bits_two[2]),.in4(1'b0),.in5(1'b0));
    logic_tile ins4(.out(cout),.clock(clock),.in1(carry[2]),.in2(four_bits_one[3]),.in3(four_bits_two[3]),.in4(1'b0),.in5(1'b0));

    logic_tile ins5(.out(four_bits_sum[0]),.clock(clock),.in1(cin),.in2(four_bits_one[0]),.in3(four_bits_two[0]),.in4(1'b0),.in5(1'b0));
    logic_tile ins6(.out(four_bits_sum[1]),.clock(clock),.in1(carry[0]),.in2(four_bits_one[1]),.in3(four_bits_two[1]),.in4(1'b0),.in5(1'b0));
    logic_tile ins7(.out(four_bits_sum[2]),.clock(clock),.in1(carry[1]),.in2(four_bits_one[2]),.in3(four_bits_two[2]),.in4(1'b0),.in5(1'b0));
    logic_tile ins8(.out(four_bits_sum[3]),.clock(clock),.in1(carry[2]),.in2(four_bits_one[3]),.in3(four_bits_two[3]),.in4(1'b0),.in5(1'b0));


endmodule
