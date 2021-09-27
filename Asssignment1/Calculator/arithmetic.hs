-- A Virtual Machine (VM) for Arithmetic (template)

-----------------------
-- Data types of the VM
-----------------------

-- Natural numbers
data NN = O | S NN
  deriving (Eq,Show) -- for equality and printing

-- Integers
data II = II NN NN
  deriving (Eq,Show) -- for equality and printing

-- Positive integers (to avoid dividing by 0)
data PP = I | T PP
  deriving (Eq,Show) -- for equality and printing

-- Rational numbers
data QQ =  QQ II PP

------------------------
-- Arithmetic on the  VM
------------------------

----------------
-- NN Arithmetic
----------------

-- add natural numbers
addN :: NN -> NN -> NN
addN O m = m
addN (S n) m = S (addN n m)

-- subtract natural bumbers
subtrN :: NN -> NN -> NN
subtrN O n = O
subtrN n O = n
subtrN (S n) (S m) = subtrN n m

-- multiply natural numbers
multN :: NN -> NN -> NN
multN O m = O
multN (S O) n = n 
multN (S n) m = addN (multN n m) m

-- minimum natural numbers
minN :: NN ->  NN -> Bool
minN n O = False
minN O m = True
minN (S n) (S m) = minN n m

-- mod natural numbers
modN :: NN -> NN -> NN
modN O O = O
modN O n = n
modN n m | minN n m==False = modN m (subtrN n m) | minN n m==True = modN n (subtrN m n)

----------------
-- II Arithmetic
----------------

----------------
-- QQ Arithmetic
----------------

-- add positive numbers
addP :: PP -> PP -> PP
addP I n = (T n)
addP (T n) m = T (addP n m)

-- subtract positive numbers
subtrP :: NN -> PP -> NN
subtrP O n = O -- can't sub a (+) from 0
subtrP (S n) I = n -- (1+n)-1=n; base case
subtrP (S n) (T m) = subtrP n m

-- multiply positive numbers
multP :: PP -> PP -> PP
multP I n = n
multP (T n) m = addP m (multP n m)

-- divide positive numbers
divP :: NN -> PP -> NN
divP n m = if n == (p2n m) then (S O)
else if (modN n(p2n m)) then O
else (addN (S O) (divP (subtrP n m)m))

-- minimum positive numbers
minP :: PP -> PP -> Bool
minP n I = False -- n ≠ or > 0
minP I n = True -- I < 1-- I < 1
minP (T n) (T m ) = minP n m

-- convert PP to NN
p2n :: PP -> NN
p2n I = (S O)
p2n (T n) = S(p2n n)

-- convert NN to PP
n2p :: NN -> PP
n2p 0 = error "0 ≠ positive number"
n2p (S O)= I
n2p (S n) = T(n2p n)

----------------
-- Normalisation
----------------

-- fractions
-- non-negative
type Frac = (NN, PP)

----------------------------------------------------
-- Converting between VM-numbers and Haskell-numbers
----------------------------------------------------

----------
-- Testing
----------
main = do
    print $ addN (S (S O)) (S O)
    print $ multN (S (S O)) (S (S (S O)))
    print $ addP (T (T I)) (T I)
