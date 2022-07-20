#ifndef __FUNCTION_KERNELS_H__
#define __FUNCTION_KERNELS_H__
#include "param.h"
#if (VVER!=1922 && VVER!=201)
#include <adf.h>
#else
#include <cardano.h>
#endif

void super_kernel_input_casc(
    input_window_int32 * ifms,     // IFMs sub-volume pointer
    input_window_int32 * weights,     // weight sub-volume pointer
	output_stream_acc48* cascadeout);

void super_kernel_casc_output(
    input_window_int32 * ifms, 
    input_window_int32 * weights,
	input_stream_acc48* cascadein,
    output_window_int32 * ofms);

void super_kernel_input_output(input_window_int8 *bufA,				//in 0
							   input_window_int8 *bufB,				//in 1
							   output_window_int8 *bufC);


void super_kernel_casc_casc(input_window_int8 *bufA, 
							input_window_int8 *bufB, 
							input_stream_acc48* cascadein, 
							output_stream_acc48* cascadeout);


#endif

// /*******************************************************************************
// /*                                                                         
// * Copyright 2019 Xilinx Inc.                                               
// *                                                                          
// * Licensed under the Apache License, Version 2.0 (the "License");          
// * you may not use this file except in compliance with the License.         
// * You may obtain a copy of the License at                                  
// *                                                                          
// *    http://www.apache.org/licenses/LICENSE-2.0                            
// *                                                                          
// * Unless required by applicable law or agreed to in writing, software      
// * distributed under the License is distributed on an "AS IS" BASIS,        
// * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
// * See the License for the specific language governing permissions and      
// * limitations under the License.                                           
// */
// *******************************************************************************/