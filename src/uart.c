#include "uart.h"

static inline void _putchar(char character) {
    UART = character;
}