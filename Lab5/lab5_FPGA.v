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
module universal_shift_register(data_load,control,clock,out_final,serial_input);
    input [1:0] control;
    input serial_input;
    input clock;
    input [7:0] data_load;
    output [7:0] out_final;
    wire [7:0] out1,out2;
    logic_tile ins1(.out(out1[0]),.clock(clock),.in1(out_final[1]),.in2(serial_input),.in3(out_final[0]),.in4(data_load[0]),.in5(control[0]));
    logic_tile ins2(.out(out1[1]),.clock(clock),.in1(out_final[2]),.in2(out_final[0]),.in3(out_final[1]),.in4(data_load[1]),.in5(control[0]));
    logic_tile ins3(.out(out1[2]),.clock(clock),.in1(out_final[3]),.in2(out_final[1]),.in3(out_final[2]),.in4(data_load[2]),.in5(control[0]));
    logic_tile ins4(.out(out1[3]),.clock(clock),.in1(out_final[4]),.in2(out_final[2]),.in3(out_final[3]),.in4(data_load[3]),.in5(control[0]));
    logic_tile ins5(.out(out1[4]),.clock(clock),.in1(out_final[5]),.in2(out_final[3]),.in3(out_final[4]),.in4(data_load[4]),.in5(control[0]));
    logic_tile ins6(.out(out1[5]),.clock(clock),.in1(out_final[6]),.in2(out_final[4]),.in3(out_final[5]),.in4(data_load[5]),.in5(control[0]));
    logic_tile ins7(.out(out1[6]),.clock(clock),.in1(out_final[7]),.in2(out_final[5]),.in3(out_final[6]),.in4(data_load[6]),.in5(control[0]));
    logic_tile ins8(.out(out1[7]),.clock(clock),.in1(serial_input),.in2(out_final[6]),.in3(out_final[7]),.in4(data_load[7]),.in5(control[0]));

    logic_tile ins9(.out(out2[0]),.clock(clock),.in1(out_final[1]),.in2(serial_input),.in3(out_final[0]),.in4(data_load[0]),.in5(control[0]));
    logic_tile ins10(.out(out2[1]),.clock(clock),.in1(out_final[2]),.in2(out_final[0]),.in3(out_final[1]),.in4(data_load[1]),.in5(control[0]));
    logic_tile ins11(.out(out2[2]),.clock(clock),.in1(out_final[3]),.in2(out_final[1]),.in3(out_final[2]),.in4(data_load[2]),.in5(control[0]));
    logic_tile ins12(.out(out2[3]),.clock(clock),.in1(out_final[4]),.in2(out_final[2]),.in3(out_final[3]),.in4(data_load[3]),.in5(control[0]));
    logic_tile ins13(.out(out2[4]),.clock(clock),.in1(out_final[5]),.in2(out_final[3]),.in3(out_final[4]),.in4(data_load[4]),.in5(control[0]));
    logic_tile ins14(.out(out2[5]),.clock(clock),.in1(out_final[6]),.in2(out_final[4]),.in3(out_final[5]),.in4(data_load[5]),.in5(control[0]));
    logic_tile ins15(.out(out2[6]),.clock(clock),.in1(out_final[7]),.in2(out_final[5]),.in3(out_final[6]),.in4(data_load[6]),.in5(control[0]));
    logic_tile ins16(.out(out2[7]),.clock(clock),.in1(serial_input),.in2(out_final[6]),.in3(out_final[7]),.in4(data_load[7]),.in5(control[0]));


    logic_tile ins17(.out(out_final[0]),.clock(clock),.in1(out2[0]),.in2(out1[0]),.in3(control[1]),.in4(1'b0),.in5(1'b0));
    logic_tile ins18(.out(out_final[1]),.clock(clock),.in1(out2[1]),.in2(out1[1]),.in3(control[1]),.in4(1'b0),.in5(1'b0));
    logic_tile ins19(.out(out_final[2]),.clock(clock),.in1(out2[2]),.in2(out1[2]),.in3(control[1]),.in4(1'b0),.in5(1'b0));
    logic_tile ins20(.out(out_final[3]),.clock(clock),.in1(out2[3]),.in2(out1[3]),.in3(control[1]),.in4(1'b0),.in5(1'b0));
    logic_tile ins21(.out(out_final[4]),.clock(clock),.in1(out2[4]),.in2(out1[4]),.in3(control[1]),.in4(1'b0),.in5(1'b0));
    logic_tile ins22(.out(out_final[5]),.clock(clock),.in1(out2[5]),.in2(out1[5]),.in3(control[1]),.in4(1'b0),.in5(1'b0));
    logic_tile ins23(.out(out_final[6]),.clock(clock),.in1(out2[6]),.in2(out1[6]),.in3(control[1]),.in4(1'b0),.in5(1'b0));
    logic_tile ins24(.out(out_final[7]),.clock(clock),.in1(out2[7]),.in2(out1[7]),.in3(control[1]),.in4(1'b0),.in5(1'b0));
endmodule