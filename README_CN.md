# mock\_uart

[English README](./README.md) | [中文README](./README_CN.md)

`mock_uart` 是一个虚拟的 UART 模块，主要用于 RTL 仿真阶段，通过 APB 总线打印日志，便于调试C程序。

## 使用方法

1. 将 `mock_uart` 直接挂接到 APB 总线上，监听 APB 总线的信号。
2. 修改 `UART_ADDR` 宏定义，通常可以在 Makefile 中或手动修改 RTL 和头文件中的两处。
3. 将 `src` 目录下的 C 文件添加到目标文件列表中。
4. 在你的测试用例中使用 `printf` 进行日志打印。
