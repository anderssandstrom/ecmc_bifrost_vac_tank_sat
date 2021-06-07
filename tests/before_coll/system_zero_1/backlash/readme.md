Not sure about abs position. Also not needed for thios test since just relative between posital and openloop counter.

Rescale posital with system_zero_2/scaledata.bash script and then scale openloop to that.

Recalculate gearratio of open loop counter by ensure correct move length.

Use the follwoing files for scale:
1. scaledata_forw.bash for backlash_forw.log
2. scaledata_back.bash for backlash_back.log

NOTE: The two scaling function only have different offsets so that motion is initiated with 0 error between openloop counter and posital encoder. This to make the backlash more visible.

Example for plot data:
cat backlash_back.log | bash scaledata_back.bash | python ~/sources/ecmccomgui/pyDataManip/plotCaMonitor.py 

