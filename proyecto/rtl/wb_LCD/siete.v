// Moudlo encargado de la sincronizacion de señales para la correcta visualizacion de datos en el LCD

module siete #(
	parameter	ix = 0,
	parameter	iy = 0
)
(   input wire [9:0] pix_x, pix_y,
    input wire [13:0] data,
    output wire on
);

   localparam g = 1;
   localparam W = 4;
   localparam H = 8;

wire s_1, s_2, s_3, s_4, s_5, s_6, s_7, s_8, s_9, s_10, s_11, s_12, s_13;

assign s_1 =  /*izq*/ (ix<=pix_x) && (pix_x<=(ix+W))/*derecha*/ && 
             /*superiorvga*/(iy<=pix_y) && (pix_y<=(iy+g))/*inferiorvga*/ && data[0]; 

assign s_2 =  /*izq*/ (ix+W<=pix_x) && (pix_x<=(ix+W+W))/*derecha*/ && 
             /*superiorvga*/(iy<=pix_y) && (pix_y<=(iy+g))/*inferiorvga*/&& data[1]; 

assign s_3 =  /*izq*/ ((ix+W+W-g)<=pix_x) && (pix_x<=(ix+W+W))/*derecha*/ && 
    /*superiorvga*/((iy)<=pix_y) && (pix_y<=(iy+H))/*inferiorvga*/&& data[2]; 


assign s_4 =  /*izq*/ ((ix+W+W-g)<=pix_x) && (pix_x<=(ix+W+W))/*derecha*/ && 
    /*superiorvga*/((iy+H)<=pix_y) && (pix_y<=(iy+H+H))/*inferiorvga*/&& data[3]; 


assign s_5 =  /*izq*/ (ix+W<=pix_x) && (pix_x<=(ix+W+W))/*derecha*/ &&  
    /*superiorvga*/((iy+H+H-g)<=pix_y) && (pix_y<=(iy+H+H))/*inferiorvga*/&& data[4]; 


assign s_6 =  /*izq*/ (ix<=pix_x) && (pix_x<=(ix+W))/*derecha*/ && 
    /*superiorvga*/((iy+H+H-g)<=pix_y) && (pix_y<=(iy+H+H))/*inferiorvga*/&& data[5]; 


assign s_7 =  /*izq*/ ((ix)<=pix_x) && (pix_x<=(ix+g))/*derecha*/ && 
    /*superiorvga*/((iy+H)<=pix_y) && (pix_y<=(iy+H+H))/*inferiorvga*/&& data[6]; 


assign s_8 =  /*izq*/ ((ix)<=pix_x) && (pix_x<=(ix+g))/*derecha*/ && 
    /*superiorvga*/((iy)<=pix_y) && (pix_y<=(iy+H))/*inferiorvga*/&& data[7]; 

assign s_9 =  /*izq*/ (ix<=pix_x) && (pix_x<=(ix+W))/*derecha*/ && 
          /*superiorvga*/((iy+H)<=pix_y) && (pix_y<=(iy+g+H))/*inferiorvga*/&& data[8]; 

assign s_10 =  /*izq*/ (ix+W<=pix_x) && (pix_x<=(ix+W+W))/*derecha*/ && 
          /*superiorvga*/((iy+H)<=pix_y) && (pix_y<=(iy+g+H))/*inferiorvga*/&& data[9]; 

assign s_11 =  /*izq*/ ((ix+W)<=pix_x) && (pix_x<=(ix+W+g))/*derecha*/ && 
    /*superiorvga*/((iy)<=pix_y) && (pix_y<=(iy+H))/*inferiorvga*/&& data[10]; 


assign s_12 =  /*izq*/ ((ix+W)<=pix_x) && (pix_x<=(ix+W+g))/*derecha*/ && 
    /*superiorvga*/((iy+H)<=pix_y) && (pix_y<=(iy+H+H))/*inferiorvga*/&& data[11]; 



assign s_13 =  /*izq*/ ((((pix_y +H +H+iy)>>2)+ix+g)<=pix_x) && (pix_x<=(((pix_y +H +H+iy)>>2)+ix))/*derecha*/ && 
    /*superiorvga*/((iy)<=pix_y) && (pix_y<=(iy+H+H))/*inferiorvga*/&& data[12]; 

assign s_14 =  /*izq*/ ((((pix_y -iy)>>2)+ix+g)<=pix_x) && (pix_x<=(((pix_y -iy)>>2)+ix))/*derecha*/ && 
    /*superiorvga*/((iy)<=pix_y) && (pix_y<=(iy+H+H))/*inferiorvga*/&& data[13]; 




assign on = s_1 || s_2 || s_3 || s_4 || s_5 || s_6 || s_7 || s_8 || s_9 || s_10 || s_11 || s_12 || s_13 || s_14;



endmodule
