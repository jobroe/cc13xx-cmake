## Example Summary

Example that uses the UART driver to echo back to the console.

## Peripherals Exercised

* `Board_GPIO_LED0` - Indicates that the board was initialized within `main()`
* `Board_UART0` - Used to echo characters from host serial session

## Resources & Jumper Settings

> If you're using an IDE (such as CCS or IAR), please refer to Board.html in
your project directory for resources used and board-specific jumper settings.
Otherwise, you can find Board.html in the directory
&lt;SDK_INSTALL_DIR&gt;/source/ti/boards/&lt;BOARD&gt;.


## Example Usage

* Open a serial session (e.g. [`PuTTY`](http://www.putty.org/ "PuTTY's
Homepage"), etc.) to the appropriate COM port.
    * The COM port can be determined via Device Manager in Windows or via
`ls /dev/tty*` in Linux.

The connection should have the following settings
```
    Baud-rate:  115200
    Data bits:       8
    Stop bits:       1
    Parity:       None
    Flow Control: None
```

* Run the example. `Board_GPIO_LED0` turns ON to indicate driver
initialization is complete.

* The target echoes back any character that is typed in the serial session.

* If the serial session is started before the target completes initialization,
the following is displayed:
`Echoing characters:`

## Application Design Details

* This example shows how to initialize the UART driver in blocking read
and write mode with no data processing and echo characters back to a console.

* A single thread, `echo`, reads a character from `Board_UART0` and writes it
back.

* Using the UART DMA Driver

The CC32XX platform has DMA support for the UART driver. The uartecho example
can be built with either the UART driver with DMA support, or the non-DMA
UART driver. The default configuration for this example is to use the non-DMA
UART driver. Since only one character at a time is sent to the UART, this
example is not an efficient use of the DMA, but it still serves to illustrate
use of the UART DMA driver. To use the DMA version of the UART driver, build
this example with the compile flag:

`--define=TI_DRIVERS_UART_DMA=1`

The *<board>.c* file includes either the UART driver with DMA support or the
non-DMA UART driver, based on this compile flag.

TI-RTOS:

* When building in Code Composer Studio, the kernel configuration project will
be imported along with the example. The kernel configuration project is
referenced by the example, so it will be built first. The "release" kernel
configuration is the default project used. It has many debug features disabled.
These feature include assert checking, logging and runtime stack checks. For a
detailed difference between the "release" and "debug" kernel configurations and
how to switch between them, please refer to the SimpleLink MCU SDK User's
Guide. The "release" and "debug" kernel configuration projects can be found
under &lt;SDK_INSTALL_DIR&gt;/kernel/tirtos/builds/&lt;BOARD&gt;/(release|debug)/(ccs|gcc).

FreeRTOS:

* Please view the `FreeRTOSConfig.h` header file for example configuration
information.

IAR:

* When using any SensorTag(STK) Board, the XDS110 debugger must be
selected with the 4-wire JTAG connection within your projects' debugger
configuration.
