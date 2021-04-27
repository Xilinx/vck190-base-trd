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
#include "graph.h"

PLIO *in1 = new PLIO("DataIn1", plio_128_bits, "data/input.txt");
PLIO *out1 = new PLIO("DataOut1", plio_128_bits, "data/output.txt");

simulation::platform<1,1> platform(in1,out1);

two_node_graph grph;

connect<> net0(platform.src[0], grph.in);
connect<> net1(grph.out, platform.sink[0]);


int main(void) {
  grph.init();
  grph.run();
  grph.end();

  return 0;
}



// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
