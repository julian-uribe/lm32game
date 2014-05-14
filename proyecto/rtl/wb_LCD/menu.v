// Moudlo encargado de la sincronizacion de señales para la correcta visualizacion de datos en el LCD

module menu (   
    input wire clk, reset,
    input wire [9:0] pix_x, pix_y,
    input wire video_on,
    input wire [13:0] data1,
    input wire [13:0] data2,
    input wire [13:0] data3,
    input wire [13:0] data4,
    input wire [13:0] data5,
    input wire [13:0] data6,
    input wire [13:0] data7,
    input wire [13:0] data8,
    input wire [13:0] data9,
    input wire [13:0] data10,
    input wire [13:0] data11,
    input wire [13:0] data12,
    input wire [13:0] data13,
    input wire [13:0] data14,
    input wire [13:0] data15,
    input wire [13:0] data16,
    input wire [13:0] data17,
    input wire [13:0] data18,
    input wire [13:0] data19,
    input wire [13:0] data20,
    input wire [13:0] data21,
    input wire [13:0] data22,
    input wire [13:0] data23,
    input wire [13:0] data24,
    input wire [13:0] data25,
    input wire [13:0] data26,
    input wire [13:0] data27,
    input wire [13:0] data28,/*
    input wire [13:0] data29,
    input wire [13:0] data30,
/*    input wire [13:0] data31,
    input wire [13:0] data32,
    input wire [13:0] data33,
    input wire [13:0] data34,
    input wire [13:0] data35,
    input wire [13:0] data36,*/
    output reg [2:0] rgb_menu
);


//--------------------------------------------
   // siete segmentos1
   //--------------------------------------------

wire on_siete1;
wire [2:0] s1_rgb;
assign s1_rgb = 3'b110; // black

siete #(
	//.ix(ix),
	//.iy(iy)
	230, 330

) 
siete1(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data1),
	.on(on_siete1)
);

//--------------------------------------------
   // siete segmentos 2
   //--------------------------------------------

wire on_siete2;
wire [2:0] s2_rgb;
assign s2_rgb = 3'b110; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	190, 330

) 
siete2(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data2),
	.on(on_siete2)
);

//--------------------------------------------
   // siete segmentos 3
   //--------------------------------------------

wire on_siete3;
wire [2:0] s3_rgb;
assign s3_rgb = 3'b110; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	150, 330

) 
siete3(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data3),
	.on(on_siete3)
);

//--------------------------------------------
   // siete segmentos 4
   //--------------------------------------------

wire on_siete4;
wire [2:0] s4_rgb;
assign s4_rgb = 3'b110; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	110, 330

) 
siete4(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data4),
	.on(on_siete4)
);

//--------------------------------------------
   // siete segmentos 5
   //--------------------------------------------

wire on_siete5;
wire [2:0] s5_rgb;
assign s5_rgb = 3'b110; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	70, 330

) 
siete5(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data5),
	.on(on_siete5)
);


//--------------------------------------------
   // siete segmentos 6
   //--------------------------------------------

wire on_siete6;
wire [2:0] s6_rgb;
assign s6_rgb = 3'b011; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	60, 280

) 
siete6(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data6),
	.on(on_siete6)
);

//--------------------------------------------
   // siete segmentos 7
   //--------------------------------------------

wire on_siete7;
wire [2:0] s7_rgb;
assign s7_rgb = 3'b011; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	74, 280

) 
siete7(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data7),
	.on(on_siete7)
);

//--------------------------------------------
   // siete segmentos 8
   //--------------------------------------------

wire on_siete8;
wire [2:0] s8_rgb;
assign s8_rgb = 3'b011; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	100, 280

) 
siete8(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data8),
	.on(on_siete8)
);


//--------------------------------------------
   // siete segmentos 9
   //--------------------------------------------

wire on_siete9;
wire [2:0] s9_rgb;
assign s9_rgb = 3'b011; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	114, 280

) 
siete9(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data9),
	.on(on_siete9)
);


//--------------------------------------------
   // siete segmentos 10
   //--------------------------------------------

wire on_siete10;
wire [2:0] s10_rgb;
assign s10_rgb = 3'b011; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	128, 280

) 
siete10(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data10),
	.on(on_siete10)
);

//--------------------------------------------
   // siete segmentos 11
   //--------------------------------------------

wire on_siete11;
wire [2:0] s11_rgb;
assign s11_rgb = 3'b011; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	142, 280

) 
siete11(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data11),
	.on(on_siete11)
);

//--------------------------------------------
   // siete segmentos 12
   //--------------------------------------------

wire on_siete12;
wire [2:0] s12_rgb;
assign s12_rgb = 3'b011; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	156, 280

) 
siete12(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data12),
	.on(on_siete12)
);

//--------------------------------------------
   // siete segmentos 13
   //--------------------------------------------

wire on_siete13;
wire [2:0] s13_rgb;
assign s13_rgb = 3'b011; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	170, 280

) 
siete13(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data13),
	.on(on_siete13)
);



//--------------------------------------------
   // siete segmentos 14
   //--------------------------------------------

wire on_siete14;
wire [2:0] s14_rgb;
assign s14_rgb = 3'b011; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	184, 280

) 
siete14(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data14),
	.on(on_siete14)
);

//--------------------------------------------
   // siete segmentos 15
   //--------------------------------------------

wire on_siete15;
wire [2:0] s15_rgb;
assign s15_rgb = 3'b101; // purple

siete #(
	//.ix(ix),
	//.iy(iy)
	360, 280

) 
siete15(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data15),
	.on(on_siete15)
);

//--------------------------------------------
   // siete segmentos 16
   //--------------------------------------------

wire on_siete16;
wire [2:0] s16_rgb;
assign s16_rgb = 3'b101; // purple

siete #(
	//.ix(ix),
	//.iy(iy)
	374, 280

) 
siete16(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data16),
	.on(on_siete16)
);

//--------------------------------------------
   // siete segmentos 17
   //--------------------------------------------

wire on_siete17;
wire [2:0] s17_rgb;
assign s17_rgb = 3'b101; // purple

siete #(
	//.ix(ix),
	//.iy(iy)
	388, 280

) 
siete17(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data17),
	.on(on_siete17)
);

//--------------------------------------------
   // siete segmentos 18
   //--------------------------------------------

wire on_siete18;
wire [2:0] s18_rgb;
assign s18_rgb = 3'b101; // purple

siete #(
	//.ix(ix),
	//.iy(iy)
	402, 280

) 
siete18(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data18),
	.on(on_siete18)
);

//--------------------------------------------
   // siete segmentos 19
   //--------------------------------------------

wire on_siete19;
wire [2:0] s19_rgb;
assign s19_rgb = 3'b101; // purple

siete #(
	//.ix(ix),
	//.iy(iy)
	416, 280

) 
siete19(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data19),
	.on(on_siete19)
);



//--------------------------------------------
   // siete segmentos 20
   //--------------------------------------------

wire on_siete20;
wire [2:0] s20_rgb;
assign s20_rgb = 3'b101; // purple

siete #(
	//.ix(ix),
	//.iy(iy)
	430, 280

) 
siete20(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data20),
	.on(on_siete20)
);

//--------------------------------------------
   // siete segmentos 21
   //--------------------------------------------

wire on_siete21;
wire [2:0] s21_rgb;
assign s21_rgb = 3'b100; // RED

siete #(
	//.ix(ix),
	//.iy(iy)
	374, 330

) 
siete21(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data21),
	.on(on_siete21)
);

//--------------------------------------------
   // siete segmentos 22
   //--------------------------------------------

wire on_siete22;
wire [2:0] s22_rgb;
assign s22_rgb = 3'b100; // RED

siete #(
	//.ix(ix),
	//.iy(iy)
	414, 330

) 
siete22(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data22),
	.on(on_siete22)
);

//--------------------------------------------
   // siete segmentos 23
   //--------------------------------------------

wire on_siete23;
wire [2:0] s23_rgb;
assign s23_rgb = 3'b100; // RED

siete #(
	//.ix(ix),
	//.iy(iy)
	454, 330

) 
siete23(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data23),
	.on(on_siete23)
);

//--------------------------------------------
   // siete segmentos 24
   //--------------------------------------------

wire on_siete24;
wire [2:0] s24_rgb;
assign s24_rgb = 3'b100; // RED

siete #(
	//.ix(ix),
	//.iy(iy)
	494, 330

) 
siete24(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data24),
	.on(on_siete24)
);

//--------------------------------------------
   // siete segmentos 25
   //--------------------------------------------

wire on_siete25;
wire [2:0] s25_rgb;
assign s25_rgb = 3'b100; // RED

siete #(
	//.ix(ix),
	//.iy(iy)
	534, 330

) 
siete25(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data25),
	.on(on_siete25)
);



//--------------------------------------------
   // siete segmentos 26
   //--------------------------------------------

wire on_siete26;
wire [2:0] s26_rgb;
assign s26_rgb = 3'b110; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	228, 100

) 
siete26(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data26),
	.on(on_siete26)
);

//--------------------------------------------
   // siete segmentos 27
   //--------------------------------------------

wire on_siete27;
wire [2:0] s27_rgb;
assign s27_rgb = 3'b110; // YELLOW

siete #(
	//.ix(ix),
	//.iy(iy)
	242, 100

) 
siete27(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data27),
	.on(on_siete27)
);

//--------------------------------------------
   // siete segmentos 28
   //--------------------------------------------

wire on_siete28;
wire [2:0] s28_rgb;
assign s28_rgb = 3'b100; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	256, 100

) 
siete28(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data28),
	.on(on_siete28)
);
/*
//--------------------------------------------
   // siete segmentos 29
   //--------------------------------------------

wire on_siete29;
wire [2:0] s29_rgb;
assign s29_rgb = 3'b011; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	270, 200

) 
siete29(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data29),
	.on(on_siete29)
);

//--------------------------------------------
   // siete segmentos 30
   //--------------------------------------------

wire on_siete30;
wire [2:0] s30_rgb;
assign s30_rgb = 3'b011; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	284, 200

) 
siete30(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data30),
	.on(on_siete30)
);
/*
//--------------------------------------------
   // siete segmentos 31
   //--------------------------------------------

wire on_siete31;
wire [2:0] s31_rgb;
assign s31_rgb = 3'b011; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	314, 200

) 
siete31(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data31),
	.on(on_siete31)
);



//--------------------------------------------
   // siete segmentos 32
   //--------------------------------------------

wire on_siete32;
wire [2:0] s32_rgb;
assign s32_rgb = 3'b011; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	328, 200

) 
siete32(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data32),
	.on(on_siete32)
);

//--------------------------------------------
   // siete segmentos 33
   //--------------------------------------------

wire on_siete33;
wire [2:0] s33_rgb;
assign s33_rgb = 3'b110; // YELLOW

siete #(
	//.ix(ix),
	//.iy(iy)
	342, 200

) 
siete33(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data33),
	.on(on_siete33)
);

//--------------------------------------------
   // siete segmentos 34
   //--------------------------------------------

wire on_siete34;
wire [2:0] s34_rgb;
assign s34_rgb = 3'b010; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	356, 200

) 
siete34(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data34),
	.on(on_siete34)
);


//--------------------------------------------
   // siete segmentos 35
   //--------------------------------------------

wire on_siete35;
wire [2:0] s35_rgb;
assign s35_rgb = 3'b110; // YELLOW

siete #(
	//.ix(ix),
	//.iy(iy)
	370, 200

) 
siete35(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data35),
	.on(on_siete35)
);

//--------------------------------------------
   // siete segmentos 36
   //--------------------------------------------

wire on_siete36;
wire [2:0] s36_rgb;
assign s36_rgb = 3'b010; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	384, 200

) 
siete36(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data36),
	.on(on_siete36)
);*/

   always @*
      if (~video_on)
         rgb_menu = 3'b000; // blank
      else
	if (on_siete1)
		rgb_menu=s1_rgb;
	else if (on_siete2)
		rgb_menu=s2_rgb;
	else if (on_siete3)
		rgb_menu=s3_rgb;
	else if (on_siete4)
		rgb_menu=s4_rgb;
	else if (on_siete5)
		rgb_menu=s5_rgb;
	else if (on_siete6)
		rgb_menu=s6_rgb;
	else if (on_siete7)
		rgb_menu=s7_rgb;
	else if (on_siete8)
		rgb_menu=s8_rgb;
	else if (on_siete9)
		rgb_menu=s9_rgb;
	else if (on_siete10)
		rgb_menu=s10_rgb;
	else if (on_siete11)
		rgb_menu=s11_rgb;
	else if (on_siete12)
		rgb_menu=s12_rgb;
	else if (on_siete13)
		rgb_menu=s13_rgb;
	else if (on_siete14)
		rgb_menu=s14_rgb;
	else if (on_siete15)
		rgb_menu=s15_rgb;
	else if (on_siete16)
		rgb_menu=s16_rgb;
	else if (on_siete17)
		rgb_menu=s17_rgb;
	else if (on_siete18)
		rgb_menu=s18_rgb;
	else if (on_siete19)
		rgb_menu=s19_rgb;
	else if (on_siete20)
		rgb_menu=s20_rgb;
	else if (on_siete21)
		rgb_menu=s21_rgb;
	else if (on_siete22)
		rgb_menu=s22_rgb;
	else if (on_siete23)
		rgb_menu=s23_rgb;
	else if (on_siete24)
		rgb_menu=s24_rgb;
	else if (on_siete25)
		rgb_menu=s25_rgb;
	else if (on_siete26)
		rgb_menu=s26_rgb;
	else if (on_siete27)
		rgb_menu=s27_rgb;
	else if (on_siete28)
		rgb_menu=s28_rgb;/*
	else if (on_siete29)
		rgb_menu=s29_rgb;
	else if (on_siete30)
		rgb_menu=s30_rgb;
/*	else if (on_siete31)
		rgb_menu=s31_rgb;
	else if (on_siete31)
		rgb_menu=s31_rgb;
	else if (on_siete32)
		rgb_menu=s32_rgb;
	else if (on_siete33)
		rgb_menu=s33_rgb;
	else if (on_siete34)
		rgb_menu=s34_rgb;
	else if (on_siete35)
		rgb_menu=s35_rgb;
	else if (on_siete36)
		rgb_menu=s36_rgb;*/
        else
            rgb_menu = 3'b000; // black background




endmodule
