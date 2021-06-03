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

DATA_OPEN=$(echo "${DATA_RAW} " | grep ${OPENLOOPPV} | awk -v CONVFMT=%.17g -v scale=8.08801E-5 -v offset=-3300.0609 '{$NF+=offset;$NF*=scale; print $0}')

# Check for overflow of SSI encoder (if value is > 1E9 then treat as minus))
DATA_SSI=$(echo "${DATA_RAW} " | grep ${SSIPV} | awk -v CONVFMT=%.17g '{if($NF>1E9){$NF=$NF-2147483648}; print $0}')

# Scale
DATA_SSI=$(echo "${DATA_SSI} " | grep ${SSIPV} | awk -v CONVFMT=%.17g -v scale=-4.45114E-5 -v offset=-690483 '{$NF+=offset;$NF*=scale; print $0}')

# Output data
echo "${DATA_OPEN} "
echo "${DATA_SSI} "
