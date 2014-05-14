#include "soc-hw.h"

LCD_t   *LCD = (LCD_t *)  	0xF0010000;
int record;


void secdelay(int n)
{
int p;
for(p=0;p<n*100000;p++){
}
}

void enviapot(int pot){
int *apun = apunpot; 
while(pot>0){
*apun=pot%10;
pot=pot/10;
apun++;
}
}

int porcentaje(int pot){
return 

return 








int put(int disp){
switch( disp )
     {
        case 1 : return 0x00000C31;

        case 2 : return 0x00000377;

	case 3 : return 0x0000033F;

	case 4 : return 0x0000038C;

	case 5 : return 0x000003BB;

	case 6 : return 0x000003FB;

	case 7 : return 0x00000F01;

	case 8 : return 0x000003FF;

	case 9 : return 0x0000038F;

	case 0 : return 0x000000FF;

	case 'J' : return 0x0000003E;

	case 'U' : return 0x000000FC;

	case 'E' : return 1011;

	case 'G' : return 1019;

	case 'O' : return 0x000000FF;

	case 'N' : return 0x00000348;

	case 'F' : return 0x000003C3;

	case 'I' : return 0x00000C33;

	case 'D' : return 0x00000C3F;

	case 'L' : return 0x000000E0;

	case 'P' : return 0x000003C7;

	case 'T' : return 0x00000C03;

	case 'A' : return 0x000003CF;

	case 'R' : return 0x00000BC7;

	case 'C' : return 0x000000E1;

	case 'S' : return 0x000003BB;

	default  : return 0x000000FF;
	}	
}

int scorecounter(){
int sco;
int i=0;
int j=0;
int k=0;
int l=0;
int m=0;
while(LCD->gameov!=1){
LCD->data1=put(i);
LCD->data2=put(j);
LCD->data3=put(k);
LCD->data4=put(l);
LCD->data5=put(m);
i++;
if(i>9){
i=0;
j++;
}
if(j>9){
j=0;
k++;
}
if(k>9){
k=0;
l++;
}
if(l>9){
l=0;
m++;
}
if(m>9){
m=0;
}

secdelay(1);
}
sco=m*10000+l*1000+k*100+j*10+i;
if(record<sco){
record=sco;
LCD->data21=put(m);
LCD->data22=put(l);
LCD->data23=put(k);
LCD->data24=put(j);
LCD->data25=put(i-1);
}
return 0;
}



