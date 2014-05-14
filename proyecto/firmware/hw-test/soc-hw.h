#ifndef SPIKEHW_H
#define SPIKEHW_H

#define PROMSTART 0x00000000
#define RAMSTART  0x00000800
#define RAMSIZE   0x400
#define RAMEND    (RAMSTART + RAMSIZE)

#define RAM_START 0x40000000
#define RAM_SIZE  0x04000000

#define FCPU      50000000

#define UART_RXBUFSIZE 32

/****************************************************************************
 * Types
 */
typedef unsigned int  uint32_t;    // 32 Bit
typedef signed   int   int32_t;    // 32 Bit

typedef unsigned char  uint8_t;    // 8 Bit
typedef signed   char   int8_t;    // 8 Bit


typedef struct {
	volatile uint32_t data1;  //0xF0010000 read
	volatile uint32_t pixel_x;  //0xF0010004 wr
	volatile uint32_t pixel_y;  //0xF0010008 wr
	volatile uint32_t gameov; //0xF001000C wr
	volatile uint32_t record;     //0xF0010010
	volatile uint32_t data2;  //0xF0010014 read
	volatile uint32_t data3;  //0xF0010018 read
	volatile uint32_t data4;  //0xF001001C read
	volatile uint32_t data5;  //0xF0010020 read
	volatile uint32_t data6;  //0xF0010024 read
	volatile uint32_t data7;  //0xF0010028 read
	volatile uint32_t data8;  //0xF001002C read
	volatile uint32_t data9;  //0xF0010030 read
	volatile uint32_t data10;  //0xF0010034 read
	volatile uint32_t data11;  //0xF0010038 read
	volatile uint32_t data12;  //0xF001003C read
	volatile uint32_t data13;  //0xF0010040 read
	volatile uint32_t data14;  //0xF0010044 read
	volatile uint32_t data15;  //0xF0010048 read
	volatile uint32_t data16;  //0xF001004C read
	volatile uint32_t data17;  //0xF0010040 read
	volatile uint32_t data18;  //0xF0010044 read
	volatile uint32_t data19;  //0xF0010048 read
	volatile uint32_t data20;  //0xF001004C read
	volatile uint32_t data21;  //0xF001004C read
	volatile uint32_t data22;  //0xF0010014 read
	volatile uint32_t data23;  //0xF0010018 read
	volatile uint32_t data24;  //0xF001001C read
	volatile uint32_t data25;  //0xF0010020 read
	volatile uint32_t data26;  //0xF0010024 read
	volatile uint32_t data27;  //0xF0010028 read
	volatile uint32_t data28;  /*//0xF001002C read
	volatile uint32_t data29;  //0xF0010030 read
	volatile uint32_t data30; /* //0xF0010034 read
	volatile uint32_t data31;  //0xF0010038 read
	volatile uint32_t data32;  //0xF001003C read
	volatile uint32_t data33;  //0xF0010040 read
	volatile uint32_t data34;  //0xF0010044 read
	volatile uint32_t data35;  //0xF0010048 read
	volatile uint32_t data36;  //0xF001004C read*/


} LCD_t;

/***************************************************************************
 * UART0
 */
#define UART_DR   0x20                    // RX Data Ready //Rx available
#define UART_ERR  0x02                    // RX Error
#define UART_BUSY 0x10                    // TX Busy


void secdelay(int n);
int put(int disp);
int scorecounter();



extern LCD_t 	*LCD; 
#endif // SPIKEHW_H
