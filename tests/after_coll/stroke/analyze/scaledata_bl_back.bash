#!/bin/bash# 
# Scale and offset data accquired 21/5-21
#
# Arg 1 Optional file name, otherwise stdin
#
# Return Complete camonitor lines scaled (with PV name and timestamp).
#
# Example:
# cat posital_issue.log | bash scaledata.bash 
#
# Author: Anders Sandström, anders.sandstrom@esss.se
#

ARGOK=0
if [ "$#" -eq 0 ]; then
    FILE="-"
    ARGOK=1
fi
if [ "$#" -eq 1 ]; then
    FILE=$1
    ARGOK=1
fi

if [ "$ARGOK" -ne 1 ]; then
  echo "scaledata: Wrong arg count..."
  exit 1  
fi


OPENLOOPPV="Axis1"
SSIPV="EL5002"

DATA_RAW=$(cat ${FILE})

# (ecmccomgui_py36) [vagrant@localhost calibration]$ python scannerToOpenloop.py 
# [ 8.10046933e-05 -2.79250575e-01]
DATA_OPEN=$(echo "${DATA_RAW} " | grep ${OPENLOOPPV} | awk -v CONVFMT=%.17g -v scale=8.10046933e-05 -v offset=-2.69250575e-01 '{$NF*=scale;$NF+=offset; print $0}')

# Check for overflow of SSI encoder (if value is > 1E9 then treat as minus))
DATA_SSI=$(echo "${DATA_RAW} " | grep ${SSIPV} | awk -v CONVFMT=%.17g '{if($NF>1E9){$NF=$NF-2147483648}; print $0}')

# ecmccomgui_py36) [vagrant@localhost calibration]$ python scannerToPosital.py 
# [-4.45181345e-05  3.07399459e+01]
# Scale
DATA_SSI=$(echo "${DATA_SSI} " | grep ${SSIPV} | awk -v CONVFMT=%.17g -v scale=-4.45181345e-05 -v offset=3.07399459e+01 '{$NF*=scale;$NF+=offset; print $0}')

# Output data
echo "${DATA_OPEN} "
echo "${DATA_SSI} "
