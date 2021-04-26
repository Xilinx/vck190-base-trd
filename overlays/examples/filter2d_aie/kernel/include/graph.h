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

#include "kernels.h"

// Static heap space is limited so need to define these as  
// parameters so that they map to Look-up tables  
// (Refer to Look-up Table section in UG1076)
extern int32 ROW1[IMAGE_WIDTH];
extern int32 ROW2[IMAGE_WIDTH];
extern int32 ROW3[IMAGE_WIDTH];

using namespace cardano;

class two_node_graph : public cardano::graph {

  private:
    kernel filter2d;
    parameter r1;
    parameter r2;
    parameter r3;
  public:
    input_port in;
    output_port out;

    two_node_graph() {
        filter2d = kernel::create(filter2D);

	r1 = parameter::array(ROW1);
	r2 = parameter::array(ROW2);
	r3 = parameter::array(ROW3);

	connect<>(r1, filter2d);
	connect<>(r2, filter2d);
	connect<>(r3, filter2d);

        connect<stream>net0 (in, filter2d.in[0]);
        connect<stream>net1 (filter2d.out[0], out);

        // Pull the source from previous lab
        source(filter2d) = "src/kernels/filter2d.cc";
        location<kernel>(filter2d) = tile(2,2);

        // Initial mapping
        runtime<ratio>(filter2d) = 0.5;
    };
};



// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
