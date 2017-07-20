# DE10-Nano Ledtest

Este es un test simple para probar las capacidades de mapear a memoria ciertos elementos desde la **FPGA** al **HPS** de la placa **de10nano**. Esto se hace utilizando los buses AXI/Avalon.

Se divide la estructura en 3 etapas:

- Encender un led de la FPGA mapeado a memoria en el HPS.
- Encender un led de la FPGA según la posición de un switch, ambos mapeados a memoria, con el HPS revisando continuamente.
- Encende un led de la FPGA según la posición de un switch que despierta una interrupción en el HPS para revisar el estado del switch.**

> 19-07-2017 ** No encontré información suficiente en las librerías para implementar la captura de interrupciones bajo Linux. Por ahora las interrupciones se simulan usando pthreads y leyendo constantemente ciertas direcciones. 

## Documentación librerías de Altera para HPS ##

Fue útil leer respecto a las librerías de C, HWLIB y SoCAL de altera:

> Altera Corporation. (2017). Intel SoC FPGA Embedded Design Suite User Guide. Altera Documentation. Retrieved from https://www.altera.com/en_US/pdfs/literature/ug/ug_soc_eds.pdf


    Reference documentation for the SoCAL API and HW Manager API are distributed as part of the Intel SoC FPGA EDS Toolkit; and are accessible online, in HTML format, from any web browser.
    The locations of the online SoC FPGA Hardware Library (HWLIB) Reference Documentation are:
    • SoC Abstraction Layer (SoCAL) API Reference Documentation:
    — Cyclone V and Arria V: <SoC FPGA EDS installation directory>/ip/ altera/hps/altera_hps/doc/soc_cv_av/socal/html/index.html
    — Arria 10: <SoC FPGA EDS installation directory>/ip/altera/hps/ altera_hps/doc/soc_a10/socal/html/index.html
    • Hardware Manager (HW Manager) API Reference Documentation: <SoC FPGA EDS installation directory>/ip/altera/hps/altera_hps/doc/hwmgr/html/ index.html
    8.3