RTHS - Real Time Hardware Sorter
=============================

![THE MULTIDIMENSIONAL SORTING ALGORITHM](https://github.com/amin-norollah/RTHS/blob/master/RTHS-logo.png)

Welcome to the RTHS, hardware description of Real Time Hardware Sorter.


Description
------------
We proposed a novel multi-dimensional sorting algorithm and its corresponding 
architecture to greatly reduce the required resources, increase memory efficiency and
have little negative impact on execution-time in the FPGA chip, while the number of input records increase.
These features make our solution a worthy replacement to other sorting techniques.
The proposed method can also be used for two other applications:
1) To implement Min/Max queues to find minimum and maximum records quickly,
2) to acquire the largest/smallest records in the big data.
In the latter case, we have access to the largest and the smallest records at any time throughout the sorting process.

The project is a simple version of the RTHS design, that can sort 4 x 4 matrix records. These project have been published for academic use only.

**If you use RTHS design in your research, we would appreciate the following citation in any publications to which it has contributed:**

A. Norollah, D. Derafshi, H. Beitollahi and M. Fazeli, "RTHS: A Low-Cost High-Performance Real-Time Hardware Sorter, Using a Multidimensional Sorting Algorithm," in IEEE Transactions on Very Large Scale Integration (VLSI) Systems.
doi: 10.1109/TVLSI.2019.2912554

![alt text](https://github.com/amin-norollah/RTHS/blob/master/Multi-Dimensional-Sorting-Algorithm.png)

Application
------------
The width of the data and the number of records received can change by tow parameters. "N" and "W" parameters can be change between 16 ~ 256 and 16 ~ 128 bits, respectively 
(According to resource available on the target FGPA chip). You can find parameters in the top module of design.
Note that changing the parameter "N" causes a change in the structure of the Bitonic Sorting Network(BSN). Therefore, BSN must also be upgraded.

The sorting process is performed similar to the multi-dimensional sorting algorithm described in our paper and proposed hardware is provided to implement it.
Some of the main modules are listed in the following table:

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

Other properties
------------
Category: Sorting Network (SN)

Language: Verilog

Development status: Stable

Manual: Included

Additional info: Design done, FPGA proven

License: GPL






