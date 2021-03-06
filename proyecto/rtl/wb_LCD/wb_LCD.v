`timescale 1ns / 1ps
//---------------------------------------------------------------------------
// Wishbone LCD 
//
// Register Description:
//
//    	0x00 ADDR0 	
//
//    	0x04 ADDR1
//
//    	0x08 ADDR2
//
//    	0x0C ADDR3
//
//	0X10 ADDR4 
//	
//	0X14 DATA
//--------------------------------------------------------------------------
module wb_LCD #(
	parameter          clk_freq = 50000000,
	parameter          baud     = 115200
)
(
	input              clk,
	input              reset,
	input		   btn,
	input		   red,
	input		   green,
	input		   blue,
	// Wishbone interface
	input              wb_stb_i,
	input              wb_cyc_i,
	output             wb_ack_o,
	input              wb_we_i,
	input       [31:0] wb_adr_i,
	input        [3:0] wb_sel_i,
	input       [31:0] wb_dat_i,
	output reg  [31:0] wb_dat_o,
//signals UCF LCD
	output  [2:0] rgbinfo,
	output  vsync,
	output  hsync


);
//---------------------------------------------------------			wb_dat_o[7:0] <= rx_data;------------------
// Actual LCD_BRAM engine
//---------------------------------------------------------------------------
wire [9:0] pixel_x;
wire [9:0] pixel_y;
wire video_on, rest;
wire  [2:0] graph_rgb, rgb_menu, graph_rgbf;
wire [31:0] camb;
reg [31:0] camb1;

//letras display

reg  [13:0] data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data18, data19, data20, data21, data22, data23, data24, data25, data26, data27, data28/*, data29, data30, data31, data32, data33, data34, data35, data36*/;
wire [13:0] data1w, data2w, data3w, data4w, data5w, data6w, data7w, data8w, data9w, data10w, data11w, data12w, data13w, data14w, data15w, data16w, data17w, data18w, data19w, data20w, data21w, data22w, data23w, data24w, data25w, data26w, data27w, data28w/*, data29w, data30w/*, data31w, data32w, data33w, data34w, data35w, data36w*/;




SYNC SYNC(
	.clk(clk),
	.reset(reset),
	.video_on(	video_on),
	.pixel_x(	pixel_x),
	.pixel_y(	pixel_y),
	.hsync(		hsync),
	.vsync(		vsync)
	);

dibuja dibuja(
	.clk(clk),
	.reset(reset),
	.video_on(	video_on),
	.pix_x(	pixel_x),
	.pix_y(	pixel_y),
	.camb(camb),
	.data1(data1w),
	.data2(data2w),
	.data3(data3w),
	.data4(data4w),
	.data5(data5w),
	.btn	(btn),
	.red	(red),
	.green	(green),
	.blue	(blue),
	.graph_rgb (graph_rgb),
	.rest (rest)
   );

menu menu(

	.clk(clk),
	.reset(reset),
	.video_on(	video_on),
	.pix_x(	pixel_x),
	.pix_y(	pixel_y),
	.data1(data1w),
	.data2(data2w),
	.data3(data3w),
	.data4(data4w),
	.data5(data5w),
	.data6(data6w),
	.data7(data7w),
	.data8(data8w),
	.data9(data9w),
	.data10(data10w),
	.data11(data11w),
	.data12(data12w),
	.data13(data13w),
	.data14(data14w),
	.data15(data15w),
	.data16(data16w),
	.data17(data17w),
	.data18(data18w),
	.data19(data19w),
	.data20(data20w),
	.data21(data21w),
	.data22(data22w),
	.data23(data23w),
	.data24(data24w),
	.data25(data25w),
	.data26(data26w),
	.data27(data27w),
	.data28(data28w),/*
	.data29(data29w),
	.data30(data30w),/*
	.data31(data31w),
	.data32(data32w),
	.data33(data33w),
	.data34(data34w),
	.data35(data35w),
	.data36(data36w),*/
	.rgb_menu(rgb_menu)
);

wire wb_rd = wb_stb_i & wb_cyc_i & ~wb_we_i;
wire wb_wr = wb_stb_i & wb_cyc_i &  wb_we_i & wb_sel_i[0];

reg  ack;

assign wb_ack_o  = wb_stb_i & wb_cyc_i & ack;

always @(posedge clk)
begin

	if (reset) begin
		data1 <= 0;
		data2 <= 0;
		data3 <= 0;
		data4 <= 0;
		data5 <= 0;
		data6 <= 0;
		data7 <= 0;
		data8 <= 0;
		data9 <= 0;
		data10 <= 0;
		data11 <= 0;
		data12 <= 0;
		data13 <= 0;
		data14 <= 0;
		data15 <= 0;
		data16 <= 0;
		data17 <= 0;
		data18 <= 0;
		data19 <= 0;
		data20 <= 0;
		data21 <= 0;
		data22 <= 0;
		data23 <= 0;
		data24 <= 0;
		data25 <= 0;
		data26 <= 0;
		data27 <= 0;
		data28 <= 0;/*
		data29 <= 0;
		data30 <= 0;/*
		data31 <= 0;
		data32 <= 0;
		data33 <= 0;
		data34 <= 0;
		data35 <= 0;
		data36 <= 0;*/

		camb1 <=0;
		//pixel_x[9:0] <= 10'b0;
		//pixel_y[9:0] <= 10'b0;
		ack    <= 0;
	end else begin
		ack    <= 0;
        	if (wb_rd & ~ack) begin             //Read cycle
         		ack<=1;
		 case(wb_adr_i[3:2])
			2'b01: begin
				wb_dat_o[31:10]<=0;
				wb_dat_o [9:0] <=pixel_x;  
				end
			2'b10: begin
				wb_dat_o[31:10]<=0;
				wb_dat_o [9:0] <=pixel_y;  
				end
			2'b11: begin
				wb_dat_o[31:1]<=0;
				wb_dat_o [0] <=rest;  
				end
		       default: wb_dat_o <= 0;    
		 endcase
       				 end 
	else if (wb_wr & ~ack )
			begin
			ack <= 1;
			case (wb_adr_i[7:0])
				'h00: begin
					data1 <= wb_dat_i[13:0];
					end
				'h14: begin
					data2 <= wb_dat_i[13:0];
					end
				'h18: begin
					data3 <= wb_dat_i[13:0];
					end
				'h1C: begin
					data4 <= wb_dat_i[13:0];
					end
				'h20: begin
					data5 <= wb_dat_i[13:0];
					end
				'h24: begin
					data6 <= wb_dat_i[13:0];
					end
				'h28: begin
					data7 <= wb_dat_i[13:0];
					end
				'h2C: begin
					data8 <= wb_dat_i[13:0];
					end
				'h30: begin
					data9 <= wb_dat_i[13:0];
					end
				'h34: begin
					data10 <= wb_dat_i[13:0];
					end
				'h38: begin
					data11 <= wb_dat_i[13:0];
					end
				'h3C: begin
					data12 <= wb_dat_i[13:0];
					end
				'h40: begin
					data13 <= wb_dat_i[13:0];
					end
				'h44: begin
					data14 <= wb_dat_i[13:0];
					end
				'h48: begin
					data15 <= wb_dat_i[13:0];
					end
				'h4C: begin
					data16 <= wb_dat_i[13:0];
					end
				'h50: begin
					data17 <= wb_dat_i[13:0];
					end
				'h54: begin
					data18 <= wb_dat_i[13:0];
					end
				'h58: begin
					data19 <= wb_dat_i[13:0];
					end
				'h5C: begin
					data20 <= wb_dat_i[13:0];
					end
				'h60: begin
					data21 <= wb_dat_i[13:0];
					end
				'h64: begin
					data22 <= wb_dat_i[13:0];
					end
				'h68: begin
					data23 <= wb_dat_i[13:0];
					end
				'h6C: begin
					data24 <= wb_dat_i[13:0];
					end
				'h70: begin
					data25 <= wb_dat_i[13:0];
					end
				'h74: begin
					data26 <= wb_dat_i[13:0];
					end
				'h78: begin
					data27 <= wb_dat_i[13:0];
					end
				'h7C: begin
					data28 <= wb_dat_i[13:0];
					end/*
				'h80: begin
					data29 <= wb_dat_i[13:0];
					end
				'h84: begin
					data30 <= wb_dat_i[13:0];
					end/*
				'h88: begin
					data31 <= wb_dat_i[13:0];
					end
				'h8C: begin
					data32 <= wb_dat_i[13:0];
					end
				'h90: begin
					data33 <= wb_dat_i[13:0];
					end
				'h94: begin
					data34 <= wb_dat_i[13:0];
					end
				'h98: begin
					data35 <= wb_dat_i[13:0];
					end
				'h9C: begin
					data36 <= wb_dat_i[13:0];
					end*/
				'h10: begin
					camb1 <= wb_dat_i[31:0];
					end
				default :begin
					data1 <= data1;
					data2 <= data2;
					data3 <= data3;
					data4 <= data4;
					data5 <= data5;
					data6 <= data6;
					data7 <= data7;
					data8 <= data8;
					data9 <= data9;
					data10 <= data10;
					data11 <= data11;
					data12 <= data12;
					data13 <= data13;
					data14 <= data14;
					data15 <= data15;
					data16 <= data16;
					data17 <= data17;
					data18 <= data18;
					data19 <= data19;
					data20 <= data20;
					data21 <= data21;
					data22 <= data22;
					data23 <= data23;
					data24 <= data24;
					data25 <= data25;
					data26 <= data26;
					data27 <= data27;
					data28 <= data28;/*
					data29 <= data29;
					data30 <= data30;
					/*data31 <= data31;
					data32 <= data32;
					data33 <= data33;
					data34 <= data34;
					data35 <= data35;
					data36 <= data36;*/
					camb1 <=camb1;
					end
			endcase
			end
		end
end
assign camb = camb1;
assign data1w = data1;
assign data2w = data2;
assign data3w = data3;
assign data4w = data4;
assign data5w = data5;
assign data6w = data6;
assign data7w = data7;
assign data8w = data8;
assign data9w = data9;
assign data10w = data10;
assign data11w = data11;
assign data12w = data12;
assign data13w = data13;
assign data14w = data14;
assign data15w = data15;
assign data16w = data16;
assign data17w = data17;
assign data18w = data18;
assign data19w = data19;
assign data20w = data20;
assign data21w = data21;
assign data22w = data22;
assign data23w = data23;
assign data24w = data24;
assign data25w = data25;
assign data26w = data26;
assign data27w = data27;
assign data28w = data28;/*
assign data29w = data29;
assign data30w = data30;
/*assign data31w = data31;
assign data32w = data32;
assign data33w = data33;
assign data34w = data34;
assign data35w = data35;
assign data36w = data36;*/


assign graph_rgbf = (rest) ? rgb_menu : (graph_rgb);
assign rgbinfo = (video_on) ? graph_rgbf : 3'b0;
endmodule


