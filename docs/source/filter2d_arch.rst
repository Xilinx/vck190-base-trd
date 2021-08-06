Accelerator - 2D Filter 
========================

This chapter provides the hardware and software architecture of the  2D Filter 
accelerator integrated into a platform. 

Hardware Architecture
---------------------

A memory-to-memory (M2M) pipeline reads video frames from memory, does certain 
processing, and then writes the processed frames back into memory. A block diagram 
of the processing pipeline is shown in the following figure.


.. image:: images/2dfilter_hw.jpg
  :width: 1000
  :alt: 2d Filter Processing Pipeline Diagram


The processing pipeline implements filter funtions 

* 2D convolution filter implemented in PL along with a data mover (DM)
* 2D convolution filter implemented in AIE along with a Tiler and Stitcher in PL

The memory-to-memory (m2m) processing pipeline with the 2D convolution filter is 
generated and integrated by the Vitis™ tool. The C-based 2D filter function is 
translated to RTL and then packaged as kernel object (.xo) using Vitis™ HLS. 
For the 2D Convolution filter in AIE the datamovers used are tiler.xo and stitcher.xo. 
The AIE compiler generates the connectivity graph (.adf) with the AIE engine and 
the program (2D convolution filter elf) to execute on AIE. The Vitis™ tool uses the 
.xo and .adf outputs from these tools and integrates the IPs into the platform.

For more information on 2D Convolution filter in PL refer to 
`Vitis Vision Library: Custom Convolution <https://xilinx.github.io/Vitis_Libraries/vision/2021.1/index.html#>`_

For more information on 2D Convolution filter in AIE refer to 
`Vitis Vision AIE Library User Guide <https://pages.gitenterprise.xilinx.com/FaaSApps/xf_opencv/2021.1/overview-aie.html#>`_

The data movers read input frames from the memory. The processing block runs 
convolution on the frame. Convolution is a common image processing technique that 
changes the intensity of a pixel to reflect the intensities of the surrounding pixels. 
This is widely used in image filters to achieve popular image effects like blur, 
sharpen, and edge detection.

The implemented algorithm uses a 3x3 kernel with programmable filter coefficients. 
The coefficients inside the kernel determine how to transform the pixels from 
the original image into the pixels of the processed image, as shown in the 
following figure.

.. image:: images/filter3x3.jpg
  :width: 1000
  :alt: 2D Convolution Filter with a 3x3 Kernel

The algorithm performs a two-dimensional (2D) convolution for each pixel of the 
input image with a 3x3 kernel. Convolution is the sum of products, one for each 
coefficient/source pixel pair. As the reference design is using a 3x3 kernel, in 
this case it is the sum of nine products.

The result of this operation is the new intensity value of the center pixel 
in the output image. This scheme is repeated for every pixel of the image in 
raster-scan order, that is, line-by-line from top-left to bottom-right. 
In total, width x height 2D convolution operations are performed to process 
the entire image.

The pixel format used in this design is YUYV which is a packed format with 16 
bits per pixel. Each pixel can be divided into two 8-bit components: one for 
luma (Y), the other for chroma (U/V alternating).

In this implementation, only the Y component is processed by the 2D convolution 
filter which is essentially a grayscale image. The reason is that the human eye 
is more sensitive to intensity than color. The combined U/Y components which 
accounts for the color is merged back into the final output image unmodified. 
The processed frame is then written back to memory by the datamover.

License
-------

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file 
except in compliance with the License.

You may obtain a copy of the License at
[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)


Unless required by applicable law or agreed to in writing, software distributed under the 
License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
either express or implied. See the License for the specific language governing permissions 
and limitations under the License.    


