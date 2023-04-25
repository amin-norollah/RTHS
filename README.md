RTHS - Real Time Hardware Sorter
=============================

<p align="center">
  <img src="https://github.com/amin-norollah/RTHS/blob/master/RTHS-logo.png" alt="realtime hardware sorter">
</p>

Welcome to the RTHS, hardware description of Real Time Hardware Sorter.


Description
------------

We have developed a groundbreaking multi-dimensional sorting algorithm and accompanying FPGA-based architecture that significantly reduces the required resources and increases memory efficiency. This method has minimal negative impact on execution time in the FPGA chip, even as the number of input records increases. As such, our solution presents a viable alternative to other sorting techniques.

In addition to its primary use case, our proposed method can also be applied in two other areas. Firstly, it can be utilized to implement Min/Max queues, allowing for the quick identification of minimum and maximum records. Secondly, it can be used to find the largest and smallest records in big data stream processing. Through the sorting process, our method provides continuous access to the largest and smallest records at any given time.

The RTHS hardware sorter utilizes a multidimensional sorting algorithm that combines parallel and pipeline processing to achieve optimal performance and low execution time. To begin the sorting process, the input records are grouped based on their values in different dimensions. These groups are then sorted in parallel, and their results are merged to produce the final sorted output. Furthermore, the RTHS design incorporates several optimizations to enhance performance, such as using hardware-friendly data structures and implementing a dynamic allocation scheme for intermediate storage. These optimizations result in a highly efficient and cost-effective hardware sorter that is ideal for real-time applications.

This project provides a simplified hardware description of the sorter, based on the RTHS design. It is capable of sorting up to 16 input records, organized in a 4 x 4 matrix. **Please note that this project is intended for academic use only.**

**If you use RTHS design in your research, we would appreciate the following citation in any publications to which it has contributed:**

A. Norollah, D. Derafshi, H. Beitollahi and M. Fazeli, "RTHS: A Low-Cost High-Performance Real-Time Hardware Sorter, Using a Multidimensional Sorting Algorithm," in IEEE Transactions on Very Large Scale Integration (VLSI) Systems.
doi: [10.1109/TVLSI.2019.2912554](https://doi.org/10.1109/TVLSI.2019.2912554)

<p align="center">
  <img src="https://github.com/amin-norollah/RTHS/blob/master/Multi-Dimensional-Sorting-Algorithm.png" alt="THE MULTIDIMENSIONAL SORTING ALGORITHM">
</p>

 >Get in touch with me by [a.norollah.official@gmail.com](mailto:a.norollah.official@gmail.com)

Application
------------
The parameters that determine the width of the data and the number of records can be adjusted using the "N" and "W" parameters, which can range from 16 to 256 and 16 to 128 bits, respectively. These values can be modified based on the resources available on the target FPGA chip, and can be found in the top module of the design.

However, it should be noted that changing the "N" parameter will alter the structure of the Bitonic Sorting Network (BSN), necessitating an upgrade to this component as well.

The sorting process employed by this hardware is similar to the multidimensional sorting algorithm described in our paper. We have provided the necessary hardware modules to implement this algorithm, some of which are listed in the table below:

Files | Description
--- | ---
0_REG.h | the registers required in each layer in all design
1_Comparator.v | comparator
1_BitonicNetwork.v | 8-input records BSN
1_BitonicPreStage.v | prestage of BSN
1_BitonicPosStage1.v | posstage of BSN, level 1
1_BitonicPosStage2.v | posstage of BSN, level 2
1_BitonicPosStage3.v | posstage of BSN, level 3
2_a_sorter.v | the Real-Time Hardware Sorter (RTHS) design for sorting 4 x 4 matrix records.
2_b_switch.v | the implicit switch design
2_c_Controller.v | the control unit
TB_BitonicNetwork.v | testbench for BSN
TB_Sorter.v | testbench for the RTHS design
Input.hex | 16 test records with 16 data width

<p align="center">
  <img src="https://github.com/amin-norollah/RTHS/blob/master/Multi-Dimensional-Sorting-Algorithm.gif" alt="how the realtime hardware sorter works">
</p>

Other properties
------------
Category: Sorting Network (SN)

Language: Verilog

Development status: Stable

Manual: Included

Additional info: Design done, FPGA proven

License: GPL






