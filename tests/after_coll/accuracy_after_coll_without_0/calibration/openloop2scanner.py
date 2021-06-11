#!/usr/bin/python
# coding: utf-8
import sys
import numpy as np

def main():

# Openloop      Laserscanner
# -58415.73047, -5.0017
# 3300.0609,    0
# 65015.79609,  4.9725
# 126731.6297,  9.9755
# 435310.8609,  34.9801
# 558742.5281,  44.989

  enc = np.array([-58415.73047,
                 65015.79609,
                 126731.6297,
                 435310.8609,
                 558742.5281])

  ref = np.array([-5.0017,
                 4.9725,
                 9.9755,
                 34.980,
                 44.989])
           
  z = np.polyfit(enc, ref, 1)

  print(z)
  
if __name__ == "__main__":
  main()
