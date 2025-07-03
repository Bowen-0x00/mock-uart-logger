# mock\_uart

[English README](./README.md) | [中文README](./README_CN.md)

`mock_uart` is a virtual UART module primarily used during RTL simulation to print logs via the APB bus, aiding in debugging.

## Usage

1. Attach the `mock_uart` directly to the APB bus to listen for APB bus signals.
2. Modify the `UART_ADDR` macro, which can be done in the Makefile or manually in both the RTL and header files.
3. Add the C files from the `src` directory to the target build list.
4. Use `printf` in your test cases to print logs.


