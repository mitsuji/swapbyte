#!/bin/sh

ghc -c SwapByte.hs
ghc -no-hs-main swapbyte.c SwapByte.o -o swapbyte

