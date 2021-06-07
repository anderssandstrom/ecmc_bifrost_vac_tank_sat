# Switch tests
Zeroposition of openloop counter at SAM zero (803488 on posital). This is outside the range. Posital is negative scaled.
This is not the correct Bifrost 0deg (only cad model 0).

Need to rescale based on posital encoder values for system_zero_2 tests to get approx correct values.





# Obsolete data below


Kill switch low test:

Engage
IOC_TEST:ec0-s3-EL5002-CH1-PosAct 2021-05-21 10:40:40.625652 793792  
IOC_TEST:Axis1-PosAct          2021-05-21 10:40:40.625652 5267.15  

Disengage
IOC_TEST:ec0-s3-EL5002-CH1-PosAct 2021-05-21 10:42:08.305645 793064  
IOC_TEST:Axis1-PosAct          2021-05-21 10:42:08.305645 5772.62  



