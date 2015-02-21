{-# LANGUAGE ForeignFunctionInterface #-}

module SwapByte(swapbyte) where

import Data.Word8(Word8)
import Foreign.Ptr(Ptr, plusPtr)
import Foreign.Storable(peek,poke)
import Control.Applicative((<*>),(<$>),(*>))

foreign export ccall swapbyte :: Ptr Word8 -> Int -> Int -> IO ()
swapbyte :: Ptr Word8 -> Int -> Int -> IO ()
swapbyte = swapbyte1


swapbyte1 :: Ptr Word8 -> Int -> Int -> IO ()
swapbyte1 p o1 o2 =
  (,) <$> (peek p1 :: IO Word8) <*> (peek p2 :: IO Word8) >>= \(b1, b2) -> poke p1 b2 *> poke p2 b1
  where
    p1 = plusPtr p o1
    p2 = plusPtr p o2

swapbyte2 :: Ptr Word8 -> Int -> Int -> IO ()
swapbyte2 p o1 o2 = do
  let p1 = plusPtr p o1
  let p2 = plusPtr p o2
  b1 <- peek p1 :: IO Word8
  b2 <- peek p2 :: IO Word8
  poke p1 b2
  poke p2 b1

    
