#include "algo_top_parameters.h"
#include "algo_top.h"
#include <algorithm>
#include <utility>

using namespace std;

void algo_top(ap_uint<384> link_in[N_INPUT_LINKS], ap_uint<384> link_out[N_OUTPUT_LINKS]) {
/*-------------use these 4 pragmas for this interface----------------------*/
#pragma HLS ARRAY_PARTITION variable=link_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=link_out complete dim=0
#pragma HLS INTERFACE ap_ctrl_hs port=return
#pragma HLS PIPELINE II=6

/*------HLS min latency pragma is applicable only for null algo------*/
#pragma HLS latency min=6

for (size_t lnk = 0; lnk < N_INPUT_LINKS; lnk++) {
	#pragma HLS UNROLL
	link_out[lnk].range(383,0) = link_in[lnk].range(383,0) ;
	}

}
