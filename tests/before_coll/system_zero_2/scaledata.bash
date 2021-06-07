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

#(ecmccomgui_py36) [dev@mcag-trgt-muts-log calibration]$ python openloop2scanner.py 
#[ 8.10412464e-05 -8.14530976e-03]
DATA_OPEN=$(echo "${DATA_RAW} " | grep ${OPENLOOPPV} | awk -v CONVFMT=%.17g -v scale=8.10412464e-05 -v offset=-8.14530976e-03 '{$NF*=scale;$NF+=offset; print $0}')

# Check for overflow of SSI encoder (if value is > 1E9 then treat as minus))
DATA_SSI=$(echo "${DATA_RAW} " | grep ${SSIPV} | awk -v CONVFMT=%.17g '{if($NF>1E9){$NF=$NF-2147483648}; print $0}')

#ecmccomgui_py36) [dev@mcag-trgt-muts-log calibration]$ python posital2scanner.py 
#[-4.45114018e-05  3.07267127e+01]
DATA_SSI=$(echo "${DATA_SSI} " | grep ${SSIPV} | awk -v CONVFMT=%.17g -v scale=-4.45114018e-05 -v offset=3.07267127e+01 '{$NF*=scale;$NF+=offset; print $0}')

# Output data
echo "${DATA_OPEN} "
echo "${DATA_SSI} "
