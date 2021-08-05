/**
 * algo_top_parameters.h
 *
 * Defines the algorithm related configuration parameters.
 */

#ifndef __ALGO_TOP_PARAMETERS_H__
#define __ALGO_TOP_PARAMETERS_H__

/** Common algorithm definitions, do not remove **/
// Un-comment to have algo as a passthrough for testing purposes
//#define ALGO_PASSTHROUGH

// Number of data words per processing cycle/frame
const int N_WORDS_PER_FRAME	= 6;
// Word has 64 bits
const int N_SHORTS_PER_WORD = 4;

/** Algorithm specific parameters **/
/** More common algorithm definitions, do not remove **/

#define N_INPUT_LINKS	36
#define N_OUTPUT_LINKS	36

// 16G inputs
#define N_INPUT_WORDS_PER_FRAME 6
// 25G outputs
#define N_OUTPUT_WORDS_PER_FRAME 6


#endif
 /* !__ALGO_TOP_PARAMETERS_H__ */
