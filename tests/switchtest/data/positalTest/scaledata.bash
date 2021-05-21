#!/b# 
# Scale and offset data accquired 21/5-21
#
# Arg 1 Optional file name, otherwise stdin
#
# Return Complete camonitor lines scaled (with PV name and timestamp).
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

DATA_OPEN=$(cat ${FILE} | grep ${OPENLOOPPV} | awk -v CONVFMT=%.17g -v scale=8.0763E-5 -v offset=0 '{$NF*=scale;$NF+=offset; print $0}')

DATA_SSI=$(cat ${FILE} | grep ${SSIPV} | awk -v CONVFMT=%.17g -v scale=4.4364E-5 -v offset=35.6531239856403 '{$NF*=scale;$NF+=offset; print $0}')

echo "${DATA_OPEN} ${DATA_SSI}"

