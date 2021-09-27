module Interpreter where

import AbsNumbers

eval :: Exp -> Integer
eval (Num n) = n

eval (Plus n m) = (eval n) + (eval m)
eval (Minus n m) = (eval n) - (eval m)

eval (Times n m) = (eval n) * (eval m)
eval (Div n m) = div (eval n) (eval m)

eval (Min n m) | (eval n) > (eval m) = (eval m) | (eval n) < (eval m) = (eval n)
eval (Max n m) | (eval n) > (eval m) = (eval n) | (eval n) < (eval m) = (eval m)

eval (Mod n m) = mod (eval n) (eval m)
