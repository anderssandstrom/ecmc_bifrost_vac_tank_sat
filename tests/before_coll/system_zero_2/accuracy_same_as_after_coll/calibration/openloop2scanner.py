#!/usr/bin/python
# coding: utf-8
import sys
import numpy as np

def main():


  enc = np.array([-61715.88281,
                  61715.78438,
                  123431.625,
                  432010.8,
                  555442.4672])

  ref = np.array([-5.0177,
                  4.9862, 
                  9.9888,
                  35.0005,
                  45.01])
                  
  z = np.polyfit(enc, ref, 1)

  print(z)
  
if __name__ == "__main__":
  main()
