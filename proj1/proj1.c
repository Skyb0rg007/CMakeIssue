#include <gsl/gsl_block.h>
#include <stdio.h>

void proj1_main(void)
{
    printf("Hello from Proj1!\n");
    gsl_block_int *blk = gsl_block_int_alloc(20);
    gsl_block_int_free(blk);
}
