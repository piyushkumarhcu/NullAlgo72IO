#ifndef __ALGO_TOP_H__
#define __ALGO_TOP_H__

#include <stdint.h>
#include <ap_axi_sdata.h>
#include <ap_int.h>
#include <hls_stream.h>

#include "algo_top_parameters.h"

void algo_top(
	ap_uint<384> link_in[N_INPUT_LINKS],
	ap_uint<384> link_out[N_OUTPUT_LINKS]
);

#endif /* !__ALGO_TOP_H__ */
