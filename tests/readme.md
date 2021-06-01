2021-06-01
Tests with alignment team.

Start to measure pos of hardstops and switches

camonitor -g10 IOC_TEST:ec0-s3-EL5002-CH1-PosAct IOC_TEST:Axis1-PosAct IOC_TEST:ec0-s1-EL1004-BI1 IOC_TEST:ec0-s1-EL1004-BI2 IOC_TEST:ec0-s1-EL1004-BI3 IOC_TEST:ec0-s1-EL1004-BI4 | tee test.log


Hardlowstop: -76719.0265625


Zero position (at SAM zero):
IOC_TEST:ec0-s3-EL5002-CH1-PosAct 2021-06-01 11:16:33.149599 690403  
IOC_TEST:Axis1-PosAct          2021-06-01 11:16:28.727628 0  

Go to 10