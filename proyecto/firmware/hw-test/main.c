#include "soc-hw.h"


//**********MAIN***********
int main(int argc, char **argv)
{
while(1){
scorecounter();


LCD->data6=put('T');
LCD->data7=put('U');

LCD->data8=put('P');
LCD->data9=put('U');
LCD->data10=put('N');
LCD->data11=put('T');
LCD->data12=put('A');
LCD->data13=put('J');
LCD->data14=put('E');

LCD->data15=put('R');
LCD->data16=put('E');
LCD->data17=put('C');
LCD->data18=put('O');
LCD->data19=put('R');
LCD->data20=put('D');


LCD->data26=put('F');
LCD->data27=put('I');
LCD->data28=put('N');


}
return 0;
}
