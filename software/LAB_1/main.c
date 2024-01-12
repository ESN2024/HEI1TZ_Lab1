#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include <time.h>

int main(void){


		time_t current_time=0;


		IOWR_ALTERA_AVALON_PIO_DATA(LED_OUT_BASE,0x01);
		current_time=clock();
		for (;(clock()-current_time)<(2 * CLOCKS_PER_SEC););
		IOWR_ALTERA_AVALON_PIO_DATA(LED_OUT_BASE,0x200);



	return 0;
};
