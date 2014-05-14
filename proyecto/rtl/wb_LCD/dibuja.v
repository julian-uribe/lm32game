`timescale 1ns / 1ps

// Listing 13.5
module dibuja
   (
    input wire clk, reset,
    input wire video_on,
    input wire btn,
    input wire red,
    input wire green,
    input wire blue,
    input wire [9:0] pix_x, pix_y,
    input wire [31:0] camb,	
    input wire [13:0] data1,
    input wire [13:0] data2,
    input wire [13:0] data3,
    input wire [13:0] data4,
    input wire [13:0] data5,
    output reg [2:0] graph_rgb,
    output reg rest
   );

   // constant and signal declaration
   // x, y coordinates (0,0) to (639,479)
   localparam MAX_X = 640;
   localparam MAX_Y = 480;
   wire refr_tick;
   wire [10:0] pix_xc;
   reg restnext=0;
   wire resetaux;
  
   //--------------------------------------------
   // barra que salta
   //--------------------------------------------
   // wall left, right boundary
   localparam munXL = 42;
   localparam munXR = 45;
   // muneco top, bottom boundary
   wire [9:0] munyt, munyb;
   localparam MUN_Y_SIZE = 60;
   // register to track top boundary  (x position is fixed)
   reg [9:0] munyreg, munynext;
   // bar moving velocity when a button is pressed
   localparam MUN_V = 10;

   


   
   //--------------------------------------------
   // object output signals
   //--------------------------------------------
   wire mun_on;
   wire mun_on_c;
   wire mun_on_mi;
   wire mun_on_md;
   reg flag;
   reg [2:0] mun_rgb = 3'b001;

   // body


//PLATAFORMA # 1

wire stand1, over1, bar_on1;
wire [2:0] bar_rgb1;
plataforma #(
//bott, top, size, vel, ini(left), corrim
   350, 330, 150, 3, 391, 4096, 1 //blue

) 
plataforma1(
	.clk(clk),
	.reset(reset||resetaux),
	.munyt(munyt),
	.munyb(munyb),
	.refr_tick(refr_tick),
	.mun_rgb(mun_rgb),
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.stand(stand1),
	.over(over1),
	.bar_on(bar_on1),
	.bar_rgb(bar_rgb1)
);


//PLATAFORMA # 2

wire stand2, over2, bar_on2;
wire [2:0] bar_rgb2;
plataforma #(
//bott, top, size, vel, ini(left), corrim
   350, 330, 150, 3, 691, 4096, 4 //red

) 
plataforma2(
	.clk(clk),
	.reset(reset||resetaux),
	.munyt(munyt),
	.munyb(munyb),
	.refr_tick(refr_tick),
	.mun_rgb(mun_rgb),
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.stand(stand2),
	.over(over2),
	.bar_on(bar_on2),
	.bar_rgb(bar_rgb2)
);


//PLATAFORMA # 3

wire stand3, over3, bar_on3;
wire [2:0] bar_rgb3;
plataforma #(
//bott, top, size, vel, ini(left), corrim
   250, 230, 190, 3, 791, 4096, 2 //green

) 
plataforma3(
	.clk(clk),
	.reset(reset||resetaux),
	.munyt(munyt),
	.munyb(munyb),
	.refr_tick(refr_tick),
	.mun_rgb(mun_rgb),
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.stand(stand3),
	.over(over3),
	.bar_on(bar_on3),
	.bar_rgb(bar_rgb3)
);


//PLATAFORMA # 4

wire stand4, over4, bar_on4;
wire [2:0] bar_rgb4;
plataforma #(
//bott, top, size, vel, ini(left), corrim
   390, 370, 190, 3, 980, 4096, 2 //green

) 
plataforma4(
	.clk(clk),
	.reset(reset||resetaux),
	.munyt(munyt),
	.munyb(munyb),
	.refr_tick(refr_tick),
	.mun_rgb(mun_rgb),
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.stand(stand4),
	.over(over4),
	.bar_on(bar_on4),
	.bar_rgb(bar_rgb4)
);


//PLATAFORMA # 5

wire stand5, over5, bar_on5;
wire [2:0] bar_rgb5;
plataforma #(
//bott, top, size, vel, ini(left), corrim
   290, 270, 100, 3, 1300, 4096, 1 //blue

) 
plataforma5(
	.clk(clk),
	.reset(reset||resetaux),
	.munyt(munyt),
	.munyb(munyb),
	.refr_tick(refr_tick),
	.mun_rgb(mun_rgb),
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.stand(stand5),
	.over(over5),
	.bar_on(bar_on5),
	.bar_rgb(bar_rgb5)
);

//PLATAFORMA # 6

wire stand6, over6, bar_on6;
wire [2:0] bar_rgb6;
plataforma #(
//bott, top, size, vel, ini(left), corrim
   320, 300, 300, 3, 1450, 4096, 4 //red

) 
plataforma6(
	.clk(clk),
	.reset(reset||resetaux),
	.munyt(munyt),
	.munyb(munyb),
	.refr_tick(refr_tick),
	.mun_rgb(mun_rgb),
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.stand(stand6),
	.over(over6),
	.bar_on(bar_on6),
	.bar_rgb(bar_rgb6)
);

//PLATAFORMA # 7

wire stand7, over7, bar_on7;
wire [2:0] bar_rgb7;
plataforma #(
//bott, top, size, vel, ini(left), corrim
   320, 300, 100, 3, 1900, 4096, 1 //blue
) 
plataforma7(
	.clk(clk),
	.reset(reset||resetaux),
	.munyt(munyt),
	.munyb(munyb),
	.refr_tick(refr_tick),
	.mun_rgb(mun_rgb),
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.stand(stand7),
	.over(over7),
	.bar_on(bar_on7),
	.bar_rgb(bar_rgb7)
);


//PLATAFORMA # 8

wire stand8, over8, bar_on8;
wire [2:0] bar_rgb8;
plataforma #(
//bott, top, size, vel, ini(left), corrim
   400, 380, 120, 3, 2080, 4096, 2 //green
) 
plataforma8(
	.clk(clk),
	.reset(reset||resetaux),
	.munyt(munyt),
	.munyb(munyb),
	.refr_tick(refr_tick),
	.mun_rgb(mun_rgb),
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.stand(stand8),
	.over(over8),
	.bar_on(bar_on8),
	.bar_rgb(bar_rgb8)
);


//PLATAFORMA # 9

wire stand9, over9, bar_on9;
wire [2:0] bar_rgb9;
plataforma #(
//bott, top, size, vel, ini(left), corrim
   300, 280, 200, 3, 2360, 4096, 4 //red
) 
plataforma9(
	.clk(clk),
	.reset(reset||resetaux),
	.munyt(munyt),
	.munyb(munyb),
	.refr_tick(refr_tick),
	.mun_rgb(mun_rgb),
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.stand(stand9),
	.over(over9),
	.bar_on(bar_on9),
	.bar_rgb(bar_rgb9)
);


//PLATAFORMA # 10

wire stand10, over10, bar_on10;
wire [2:0] bar_rgb10;
plataforma #(
//bott, top, size, vel, ini(left), corrim
   300, 280, 100, 3, 2660, 4096, 1 //blue
) 
plataforma10(
	.clk(clk),
	.reset(reset||resetaux),
	.munyt(munyt),
	.munyb(munyb),
	.refr_tick(refr_tick),
	.mun_rgb(mun_rgb),
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.stand(stand10),
	.over(over10),
	.bar_on(bar_on10),
	.bar_rgb(bar_rgb10)
);


//PLATAFORMA # 11

wire stand11, over11, bar_on11;
wire [2:0] bar_rgb11;
plataforma #(
//bott, top, size, vel, ini(left), corrim
   200, 180, 100, 3, 2660, 4096, 4 //red
) 
plataforma11(
	.clk(clk),
	.reset(reset||resetaux),
	.munyt(munyt),
	.munyb(munyb),
	.refr_tick(refr_tick),
	.mun_rgb(mun_rgb),
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.stand(stand11),
	.over(over11),
	.bar_on(bar_on11),
	.bar_rgb(bar_rgb11)
);


//PLATAFORMA # 12

wire stand12, over12, bar_on12;
wire [2:0] bar_rgb12;
plataforma #(
//bott, top, size, vel, ini(left), corrim
   400, 380, 200, 3, 3000, 4096, 2 //green
) 
plataforma12(
	.clk(clk),
	.reset(reset||resetaux),
	.munyt(munyt),
	.munyb(munyb),
	.refr_tick(refr_tick),
	.mun_rgb(mun_rgb),
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.stand(stand12),
	.over(over12),
	.bar_on(bar_on12),
	.bar_rgb(bar_rgb12)
);


//PLATAFORMA # 13

wire stand13, over13, bar_on13;
wire [2:0] bar_rgb13;
plataforma #(
//bott, top, size, vel, ini(left), corrim
   270, 250, 100, 3, 3350, 4096, 1 //blue
) 
plataforma13(
	.clk(clk),
	.reset(reset||resetaux),
	.munyt(munyt),
	.munyb(munyb),
	.refr_tick(refr_tick),
	.mun_rgb(mun_rgb),
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.stand(stand13),
	.over(over13),
	.bar_on(bar_on13),
	.bar_rgb(bar_rgb13)
);


//PLATAFORMA # 14

wire stand14, over14, bar_on14;
wire [2:0] bar_rgb14;
plataforma #(
//bott, top, size, vel, ini(left), corrim
   170, 150, 100, 3, 3550, 4096, 4 //red
) 
plataforma14(
	.clk(clk),
	.reset(reset||resetaux),
	.munyt(munyt),
	.munyb(munyb),
	.refr_tick(refr_tick),
	.mun_rgb(mun_rgb),
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.stand(stand14),
	.over(over14),
	.bar_on(bar_on14),
	.bar_rgb(bar_rgb14)
);

//PLATAFORMA # 15

wire stand15, over15, bar_on15;
wire [2:0] bar_rgb15;
plataforma #(
//bott, top, size, vel, ini(left), corrim
   410, 390, 150, 3, 3900, 4096, 2 //green
) 
plataforma15(
	.clk(clk),
	.reset(reset||resetaux),
	.munyt(munyt),
	.munyb(munyb),
	.refr_tick(refr_tick),
	.mun_rgb(mun_rgb),
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.stand(stand15),
	.over(over15),
	.bar_on(bar_on15),
	.bar_rgb(bar_rgb15)
);

//PLATAFORMA # 16

wire stand16, over16, bar_on16;
wire [2:0] bar_rgb16;
plataforma #(
//bott, top, size, vel, ini(left), corrim
   390, 370, 500, 3, 4100, 4096, 1 //blue
) 
plataforma16(
	.clk(clk),
	.reset(reset||resetaux),
	.munyt(munyt),
	.munyb(munyb),
	.refr_tick(refr_tick),
	.mun_rgb(mun_rgb),
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.stand(stand16),
	.over(over16),
	.bar_on(bar_on16),
	.bar_rgb(bar_rgb16)
);



//--------------------------------------------
   // siete segmentos1
   //--------------------------------------------

wire on_siete1;
wire [2:0] s1_rgb;
assign s1_rgb = 3'b000; // black

siete #(
	//.ix(ix),
	//.iy(iy)
	400, 20

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
assign s2_rgb = 3'b000; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	360, 20

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
assign s3_rgb = 3'b000; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	320, 20

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
assign s4_rgb = 3'b000; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	280, 20

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
assign s5_rgb = 3'b000; // green

siete #(
	//.ix(ix),
	//.iy(iy)
	240, 20

) 
siete5(
	.pix_x(	pix_x),
	.pix_y(	pix_y),
	.data(data5),
	.on(on_siete5)
);





   // registers
   always @(posedge clk, posedge reset)
      if (reset)
		begin
	    munyreg <=100-MUN_Y_SIZE;
	    rest <= 0;
		end
      else
         begin
	begin
if(red) mun_rgb=3'b100;
else if (green) mun_rgb=3'b010;
else if (blue) mun_rgb=3'b001;
else mun_rgb = mun_rgb;
end
	    munyreg <= munynext;
	    rest <=restnext;
         end

   // refr_tick: 1-clock tick asserted at start of v-sync
   //            i.e., when the screen is refreshed (60 Hz)
   assign refr_tick = (pix_y==481) && (pix_x==0);
   assign pix_xc=pix_x+MAX_X;


   //--------------------------------------------
   // muneco
   //--------------------------------------------
   // boundary
   assign munyt = munyreg;
   assign munyb = munyt + MUN_Y_SIZE - 1;
   // pixel within muneco
   assign mun_on = (munXL<=pix_x) && (pix_x<=munXR) &&
                   (munyt<=pix_y) && (pix_y<=munyb);
   assign mun_on_c = (munXL-5<=pix_x) && (pix_x<=munXR+5) &&
                   (munyt-13<=pix_y) && (pix_y<=munyt);
   assign mun_on_mi = (munXL-7<=pix_x) && (pix_x<=munXL) &&
                   (munyt+20<=pix_y) && (pix_y<=munyt+23);
   assign mun_on_md = (munXR<=pix_x) && (pix_x<=munXR+7) &&
                   (munyt+20<=pix_y) && (pix_y<=munyt+23);


   // new muneco position
   always @*
   begin
      restnext = rest;
      munynext = munyreg; // no move
	if(rest && btn && blue) restnext=0;
      if(rest)	munynext=100-MUN_Y_SIZE;	
else

      if (refr_tick)
	 if (over1||over2||over3||over4||over5||over6||over7||over8||over9||over10||over11||over12||over13||over14||over15||over16)
		restnext=1;//munynext=100-MUN_Y_SIZE;	
         else if (stand1||stand2||stand3||stand4||stand5||stand6||stand7||stand8||stand9||stand10||stand11||stand12||stand13||stand14||stand15||stand16)
		begin
		flag<=0;
		if(btn)
			begin
			flag<=1;
			munynext=munyreg-4; //arriba vel 20
			end
		else munynext=munyreg;
		end
	else if(munyt<470 && munyt>350 && flag && btn)  //NO ESTA PARADO, SALTO, Y SIGUE SALTANDO
            munynext = munyreg - 3; // move up
         else if (munyt <349 && munyt>222 && flag && btn) //NO ESTA PARADO, SALTO, Y SIGUE SALTANDO
			munynext = munyreg - 2; // move up
         else if (munyt <223 && munyt>85 && flag && btn) //NO ESTA PARADO, SALTO, Y SIGUE SALTANDO
			munynext = munyreg - 1; // move up
         else if (munyt <470 && munyt>85 && flag && ~btn) //NO ESTA PARADO, SALTO, Y DEJO DE SALTAR
			begin
			flag<=0;
			munynext=munyreg +1;
			end
	 else if (munyt <86 && flag)	//NO ESTA PARADO, SALTO Y LLEGO MUY ALTO
			begin
			flag<=0;
			munynext=munyreg +1;
			end
	else if(munyt>618)
		restnext=1;//munynext=100-MUN_Y_SIZE;

	else munynext=munyreg +2;
   end




assign resetaux = rest;
   //--------------------------------------------
   // rgb multiplexing circuit
   //--------------------------------------------
   always @*
      if (~video_on)
         graph_rgb = 3'b000; // blank
      else
        if (bar_on1)
            graph_rgb = bar_rgb1;
	else if (bar_on2)
		graph_rgb=bar_rgb2;
	else if (bar_on3)
		graph_rgb=bar_rgb3;
	else if (bar_on4)
		graph_rgb=bar_rgb4;
	else if (bar_on5)
		graph_rgb=bar_rgb5;
	else if (bar_on6)
		graph_rgb=bar_rgb6;
	else if (bar_on7)
		graph_rgb=bar_rgb7;
	else if (bar_on8)
		graph_rgb=bar_rgb8;
	else if (bar_on9)
		graph_rgb=bar_rgb9;
	else if (bar_on10)
		graph_rgb=bar_rgb10;
	else if (bar_on11)
		graph_rgb=bar_rgb11;
	else if (bar_on12)
		graph_rgb=bar_rgb12;
	else if (bar_on13)
		graph_rgb=bar_rgb13;
	else if (bar_on14)
		graph_rgb=bar_rgb14;
	else if (bar_on15)
		graph_rgb=bar_rgb15;
	else if (bar_on16)
		graph_rgb=bar_rgb16;
	else if (mun_on)
		graph_rgb=mun_rgb;
	else if (mun_on_c)
		graph_rgb=mun_rgb;
	else if (mun_on_mi)
		graph_rgb=mun_rgb;
	else if (mun_on_md)
		graph_rgb=mun_rgb;
	else if (on_siete1)
		graph_rgb=s1_rgb;
	else if (on_siete2)
		graph_rgb=s2_rgb;
	else if (on_siete3)
		graph_rgb=s3_rgb;
	else if (on_siete4)
		graph_rgb=s4_rgb;
	else if (on_siete5)
		graph_rgb=s5_rgb;
        else
            graph_rgb = 3'b111; // white background

endmodule
