
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include "sys/unistd.h"
#include "sys/time.h"
#include "sys/alt_sys_init.h"


#include <sys/alt_irq.h>



volatile alt_u32 delay= 1000000; //init global � 1 sec
volatile alt_u32 speed= 1000000;
volatile alt_u16 cpt=0x0F;

static void irqhandler (void * context, alt_u32 id)
{
	alt_u8 Switch_button=IORD_ALTERA_AVALON_PIO_DATA(PIO_0_BASE);
	speed= delay/Switch_button;
	alt_printf("%c\n",delay);
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PUSHBUTTON_TRIGGER_BASE,0x1);

}


int main(void) {
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PUSHBUTTON_TRIGGER_BASE,0x1);
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PUSHBUTTON_TRIGGER_BASE,0x1);

	alt_irq_register( PUSHBUTTON_TRIGGER_IRQ, NULL, (void*)irqhandler );

	for(;;) {

		for( alt_u8 i=0; i<10;i++)
		{

			IOWR_ALTERA_AVALON_PIO_DATA(LED_OUT_BASE,cpt);
			usleep(speed);
			IOWR_ALTERA_AVALON_PIO_DATA(LED_OUT_BASE,0x00);
			usleep(speed);
			cpt=cpt<<1;
		}
		cpt=0x0F;
			}

    return 0;
}
