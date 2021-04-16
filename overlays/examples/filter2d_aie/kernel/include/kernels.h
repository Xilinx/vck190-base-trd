/*
 * Copyright 2019 Xilinx, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * Author: Jack Lo <jackl@xilinx.com>
 *         Kristof Denolf <kristof@xilinx.com>
 */

#include <cardano.h>

#ifndef IMAGE_WIDTH
#define IMAGE_WIDTH 	1280
#endif
#ifndef IMAGE_HEIGHT
#define IMAGE_HEIGHT 	720
#endif

void filter2D( input_stream_int32 * img_in, output_stream_int32 * img_out);


// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
