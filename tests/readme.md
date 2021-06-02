2021-06-01
Tests with alignment team.

Start to measure pos of hardstops and switches

camonitor -g10 IOC_TEST:ec0-s3-EL5002-CH1-PosAct IOC_TEST:Axis1-PosAct IOC_TEST:ec0-s1-EL1004-BI1 IOC_TEST:ec0-s1-EL1004-BI2 IOC_TEST:ec0-s1-EL1004-BI3 IOC_TEST:ec0-s1-EL1004-BI4 | tee test.log


Hardlowstop: -76719.0265625


Zero position (at SAM zero):
IOC_TEST:ec0-s3-EL5002-CH1-PosAct 2021-06-01 11:16:33.149599 690403  
IOC_TEST:Axis1-PosAct          2021-06-01 11:16:28.727628 0  

Go to 10

2021-06-01
First half day was dedicated to calibrate the gear ratio.
Otherhalf was dedicated to repeatability tests.


2021-06-02
Need todo:
Accuracy
Range 
High speed 01.deg/s  => 1280motor degs/s

Start at same 0 as we had yesterday (we stopped IOC at 0 position and started IOC at same place!)

Collision with concrete when appaching forward hard stop. Lost steps and 0 position
resulted in 3300.0609 motor degree offset of open loop counter (new zero according to poistal is 33001.0609, for open loop counter) This happend for the last test of.

