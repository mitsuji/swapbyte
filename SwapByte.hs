{-# LANGUAGE ForeignFunctionInterface #-}

module SwapByte(swap) where

import Foreign.Ptr(Ptr, plusPtr)
import Foreign.Storable(peek,poke)
import Data.Word8(Word8)

foreign export ccall swap :: Ptr Word8 -> IO ()
swap :: Ptr Word8 -> IO ()
swap = swap1

swap1 :: Ptr Word8 -> IO ()
swap1 p = (peek p3 :: IO Word8) >>= ( \b3 -> (peek p7 :: IO Word8) >>= ( \b7 -> poke p3 b7 >> poke p7 b3 ) )
  where
    p3 = plusPtr p 3
    p7 = plusPtr p 7
         
swap2 :: Ptr Word8 -> IO ()
swap2 p = do
  b3 <- peek p3 :: IO Word8
  b7 <- peek p7 :: IO Word8
  poke p3 b7
  poke p7 b3
  where
    p3 = plusPtr p 3
    p7 = plusPtr p 7

