
module CompilingCoinduction where

open import Common.Coinduction
open import Common.Char
open import Common.String

data Unit : Set where
  unit : Unit

{-# COMPILED_DATA Unit () () #-}

postulate
  IO : Set → Set

{-# COMPILED_TYPE IO IO #-}
{-# BUILTIN IO IO #-}

{-# IMPORT Data.Text.IO #-}

postulate
  putStrLn : ∞ String → IO Unit

{-# COMPILED putStrLn Data.Text.IO.putStrLn #-}
{-# COMPILED_UHC putStrLn (UHC.Agda.Builtins.primPutStrLn) #-}
{-# COMPILED_JS putStrLn function(x) { return function(cb) { process.stdout.write(x(0) + "\n"); cb(0); }; } #-}

main = putStrLn (♯ "a")
