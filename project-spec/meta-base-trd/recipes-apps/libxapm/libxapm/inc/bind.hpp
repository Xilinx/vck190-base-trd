/*
 * Copyright (C) 2019 Xilinx, Inc.  All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * XILINX BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * Except as contained in this notice, the name of the Xilinx shall not be used
 * in advertising or otherwise to promote the sale, use or other dealings in
 * this Software without prior written authorization from Xilinx.
 */ 

#include <boost/python.hpp>
#include <boost/python/suite/indexing/vector_indexing_suite.hpp> 
#ifndef __XAPM_HPP__
#include "xapm.hpp"
#endif

using namespace boost::python;

std::vector<apm_t> toVector(list l){ 
  std::vector<apm_t> a;
  for (int i = 0; i < len(l); i++){
    apm_t x = {.addr = extract<uintptr_t>(l[i][0]), 
           .slot = extract<size_t>(l[i][1]), 
           .msr_read = extract<uint32_t>(l[i][2]), 
           .msr_write = extract<uint32_t>(l[i][3]), 
           .smcr = extract<uint32_t>(l[i][4]),
       	   .apm_num = extract<uint32_t>(l[i][5]),
       	   .clock_freq = extract<uint32_t>(l[i][6])};
    a.push_back(x);
  }
  return a;        
}

boost::python::list setup(){
	uint32_t clk = 206248000;
	std::vector<uint32_t> HDMI_YUY2_PLANE_READ = {0xA40A0000, 0, 0x44, 0x03, 0x200, 0, clk};
	std::vector<uint32_t> MIPI_READ = {0xA40A0000, 1, 0x44, 0x2300, 0x210, 0, clk};
	std::vector<uint32_t> HDMI_RGB_PLANE_READ = {0xA40A0000, 2, 0x44, 0x430000, 0x220, 0, clk};
	std::vector<uint32_t> HDMI_PRIMARY_PLANE_READ = {0xA40A0000, 3, 0x44, 0x63000000, 0x230, 0, clk};
	std::vector<uint32_t> ACCEL_READ = {0xA40A0000, 4, 0x48, 0x83, 0x240, 0, clk};
	std::vector<uint32_t> HDMI_YUY2_PLANE_WRITE = {0xA40A0000, 5, 0x48, 0x0200, 0x250, 0, clk};
	std::vector<uint32_t> MIPI_WRITE = {0xA40A0000, 6, 0x48, 0x220000, 0x260, 0, clk};
	std::vector<uint32_t> HDMI_RGB_PLANE_WRITE = {0xA40A0000, 7, 0x48, 0x42000000, 0x270, 0, clk};
	std::vector<uint32_t> HDMI_PRIMARY_PLANE_WRITE = {0xA40A0000, 8, 0x4C, 0x62, 0x280, 0, clk};
	std::vector<uint32_t> ACCEL_WRITE = {0xA40A0000, 9, 0x4C, 0x8200, 0x290, 0, clk};
	std::vector<std::vector<uint32_t>> preset = {HDMI_PRIMARY_PLANE_READ,
					   HDMI_YUY2_PLANE_READ,
					   HDMI_RGB_PLANE_READ,
                       ACCEL_WRITE,
                       ACCEL_READ,
                       MIPI_WRITE};
	boost::python::list fin;
	for (int i = 0; i < preset.size(); i++){
		boost::python::list temp;
		for (int j = 0; j < preset[i].size(); j++){
			temp.append(preset[i][j]);
		}
		fin.append(temp);
	}

	return fin;


}

BOOST_PYTHON_MODULE(libxapm)
{
    class_<APM>("APM", init<list>())
       .def_readwrite("port", &APM::port)
       .def("getThroughput", &APM::getThroughput)
    ;
    list l = setup();
    scope().attr("preset") = l;
    scope().attr("MB/s") = 0;
    scope().attr("Gbps") = 1;

}
