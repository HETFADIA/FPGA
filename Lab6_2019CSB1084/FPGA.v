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
module universal_shift_register(data_load,control,clock,out_final,serial_input,c2);

    input c2;

    input [1:0] control;
    input serial_input;
    input clock;
    input [7:0] data_load;
    output [7:0] out_final;
    wire [7:0] out1,out2;
    wire [7:0] temp_output;

    wire [3:0] temp,temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11,temp12,temp13,temp14,temp15,temp16;

    switch_box_4x4 inst1(.out(temp),.in({1'b0,1'b0,1'b0,c2}));//in decoder c2 will be selected and in universal it will be 0
    switch_box_4x4 inst2(.out(temp1),.in({data_load[0],out2[0],out1[0],control[0]}));//in decoder {0,0,control0,control0} and in unviversal {0,0,out1,out2}
    switch_box_4x4 inst3(.out(temp2),.in({data_load[1],out2[1],out1[1],control[0]}));
    switch_box_4x4 inst4(.out(temp3),.in({data_load[2],out2[2],out1[2],control[0]}));
    switch_box_4x4 inst5(.out(temp4),.in({data_load[3],out2[3],out1[3],control[0]}));
    switch_box_4x4 inst6(.out(temp5),.in({data_load[0],out2[4],out1[4],control[0]}));
    switch_box_4x4 inst7(.out(temp6),.in({data_load[1],out2[5],out1[5],control[0]}));
    switch_box_4x4 inst8(.out(temp7),.in({data_load[2],out2[6],out1[6],control[0]}));
    switch_box_4x4 inst9(.out(temp8),.in({data_load[3],out2[7],out1[7],control[0]}));
    switch_box_4x4 inst10(.out(temp9),.in({data_load[4],control[1],1'b0,1'b0}));
    switch_box_4x4 inst11(.out(temp10),.in({data_load[5],control[1],1'b0,1'b0}));
    switch_box_4x4 inst12(.out(temp11),.in({data_load[6],control[1],1'b0,1'b0}));
    switch_box_4x4 inst13(.out(temp12),.in({data_load[7],control[1],1'b0,1'b0}));
    switch_box_4x4 inst14(.out(temp13),.in({c2,1'b0,1'b0,1'b0}));
    switch_box_4x4 inst15(.out(temp14),.in({out_final[0],1'b0,1'b0,1'b0}));
    switch_box_4x4 inst16(.out(temp15),.in({out_final[1],1'b0,1'b0,1'b0}));
    switch_box_4x4 inst17(.out(temp16),.in({out_final[2],1'b0,1'b0,1'b0}));



    

    logic_tile ins1(.out(out1[0]),.clock(clock),.in1(out_final[1]),.in2(serial_input),.in3(out_final[0]),.in4(data_load[0]),.in5(control[0]));//in decoder out_final will be selected
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

    logic_tile ins17(.out(out_final[0]),.clock(clock),.in1(temp1[0]),.in2(temp1[1]),.in3(temp9[0]),.in4(temp[0]),.in5(temp13[0]));//temp1[0] contains num1 bit temp9[0] num2 bit and temp13[0] contains carry bit
    logic_tile ins18(.out(out_final[1]),.clock(clock),.in1(temp2[0]),.in2(temp2[1]),.in3(temp10[0]),.in4(temp[0]),.in5(temp14[0]));
    logic_tile ins19(.out(out_final[2]),.clock(clock),.in1(temp3[0]),.in2(temp3[1]),.in3(temp11[0]),.in4(temp[0]),.in5(temp15[0]));
    logic_tile ins20(.out(out_final[3]),.clock(clock),.in1(temp4[0]),.in2(temp4[1]),.in3(temp12[0]),.in4(temp[0]),.in5(temp16[0]));
    logic_tile ins21(.out(out_final[4]),.clock(clock),.in1(temp5[0]),.in2(temp5[1]),.in3(temp9[0]),.in4(temp[0]),.in5(temp13[0]));//temp13[0] contains cin bit
    logic_tile ins22(.out(out_final[5]),.clock(clock),.in1(temp6[0]),.in2(temp6[1]),.in3(temp10[0]),.in4(temp[0]),.in5(temp14[0]));
    logic_tile ins23(.out(out_final[6]),.clock(clock),.in1(temp7[0]),.in2(temp7[1]),.in3(temp11[0]),.in4(temp[0]),.in5(temp15[0]));
    logic_tile ins24(.out(out_final[7]),.clock(clock),.in1(temp8[0]),.in2(temp8[1]),.in3(temp12[0]),.in4(temp[0]),.in5(temp16[0]));
endmodule