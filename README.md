# DE10-Nano Ledtest

Este es un test simple para probar las capacidades de mapear a memoria ciertos elementos desde la **FPGA** al **HPS** de la placa **de10nano**. Esto se hace utilizando los buses AXI/Avalon.

Se divide la estructura en 3 etapas:

- Encender un led de la FPGA mapeado a memoria en el HPS.
- Encender un led de la FPGA según la posición de un switch, ambos mapeados a memoria, con el HPS revisando continuamente.
- Encende un led de la FPGA según la posición de un switch que despierta una interrupción en el HPS para revisar el estado del switch.
