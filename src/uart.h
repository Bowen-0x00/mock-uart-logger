#ifndef _UART_H_
#define _UART_H_

// #define UART_ADDR 0x40011000 // Example UART address, change as needed. In range of apb range.
#define UART (*((volatile unsigned int *)UART_ADDR))

#endif