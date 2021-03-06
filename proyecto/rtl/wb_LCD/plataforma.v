`timescale 1ns / 1ps

// Listing 13.5
module plataforma #(
	parameter	BARYB_B = 0,
	parameter	BARYT_B = 0,
	parameter	BAR_X_SIZE = 0,
	parameter	BAR_V = 0,
	parameter	inicio = 0,
	parameter	corrim = 0,
	parameter	color = 0
)
   (
    input wire clk, reset,
    input wire [9:0] pix_x, pix_y,	
    input wire [9:0] munyt,
    input wire [9:0] munyb,
    input wire refr_tick,
    input wire [2:0] mun_rgb,
    output wire stand, over, bar_on,
    output wire [2:0] bar_rgb
   );

   localparam MAX_X = 640;
   localparam MAX_Y = 480;
   localparam munXL = 42;
   localparam munXR = 45;

   wire [13:0] pix_xc;

assign bar_rgb [2:0] = color;
  

   // La plataforma
   //--------------------------------------------
   // plataforma arriba y abajo limites
   reg [13:0] BARYB = BARYB_B;
   reg [13:0] BARYT = BARYT_B;

   // plataforma derecha e izquierda limites
   wire [13:0] barxr, barxl;

   // register to track left boundary  (y position is fixed)
   reg [13:0] barxreg, barxnext;





   // body




   // registers
   always @(posedge clk, posedge reset)
      if (reset)
            barxreg <= inicio;  //incio defecto del bloque 
      else
            barxreg <= barxnext;

   // refr_tick: 1-clock tick asserted at start of v-sync
   //            i.e., when the screen is refreshed (60 Hz)
   assign pix_xc=pix_x+corrim;

   //--------------------------------------------
   // plataforma 
   //--------------------------------------------
   // boundary
   assign barxl = barxreg;
   assign barxr = barxl + BAR_X_SIZE - 1;
   // pixel within bar
   assign bar_on = (barxl<=pix_xc) && (pix_xc<=barxr) &&
                   (BARYT<=pix_y) && (pix_y<=BARYB);



   // new bar position
   always @*
   begin
      barxnext = barxreg; // no move
      if (refr_tick)
         if (barxl > 140)
            barxnext = barxreg - BAR_V; // move left
         else
	    begin		
            barxnext = corrim+MAX_X; // return default
	    BARYB <= BARYB_B;
 	    BARYT <= BARYT_B;
	    end	
   end



//Permite al muneco estar parado en plataforma 1

assign stand = (mun_rgb==bar_rgb) && (munyb>(BARYT-2)) && (munyb<(BARYT+2)) && ((barxr-corrim)>munXL) && ((barxl-corrim)<munXR);
// Game over por choque con plataforma 1

assign over =(mun_rgb==bar_rgb) && (munyt>(BARYB-2)) && (munyt<(BARYB+2)) && ((barxr-corrim)>munXL) && ((barxl-corrim)<munXR) || munXR==barxl && munyt<BARYB && munyb>BARYT;



endmodule
