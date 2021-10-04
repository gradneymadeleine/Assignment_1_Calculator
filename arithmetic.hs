-- A Virtual Machine (VM) for Arithmetic (template)

-----------------------
-- Data types of the VM
-----------------------

-- Natural numbers
data NN = O | S NN
  deriving (Eq,Show) -- for equality and printing

-- Integers
data II = II NN NN -- II is subtraction of 2 NN numbers
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

-- Addition: (a-b)+(c-d)=(a+c)-(b+d)
addI :: II -> II -> II
addI (II a b) (II c d) = II (addN a c) (addN b d)

-- Multiplication: (a-b)*(c-d)=(ac+bd)-(ad+bc)
multI :: II -> II -> II
multI (II a b) (II c d) = II (addN (multN a c) (multN b d)) (addN (multN a d) (multN b c))

-- Subtraction: (a-b)-(c-d)=(a+d)-(b+c)
subtrI :: II -> II -> II
subtrI (II a b) (II c d) = II (addN a d) (addN b c)

-- Negation: -(a-b)=(b-a)
negI :: II -> II
negI (II a b) = II b a

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

-- minimum positive numbers
minP :: PP -> PP -> Bool
minP n I = False -- n ≠ or > 0
minP I n = True -- I < 1-- I < 1
minP (T n) (T m ) = minP n m

-- Addition: (a/b)+(c/d)=(ad+bc)/(bd)
addQ :: QQ -> QQ -> QQ
addQ (QQ a b) (QQ c d) = QQ (addI (multI a (pp_ii d)) (multI c (pp_ii b))) (multP b d)

-- Multiplication: (a/b)*(c/d)=(ac)/(bd)
multQ :: QQ -> QQ -> QQ
multQ (QQ a b) (QQ c d) = QQ (multI a c) (multP b d)

----------------
-- Normalisation
----------------

-- Normalisation of II->II
normalizeI :: II -> II
normalizeI (II n O) = (II n O)
normalizeI (II O n) = (II O n)
normalizeI (II (S n) (S m)) = normalizeI (II n m)

-- Normalization by evaulation
nbv :: II -> II
nbv (II n m) = II (nn_int(int_nn(n) - int_nn(m))) (O)

-- fractions
-- non-negative
type Frac = (NN, PP)

----------------------------------------------------
-- Converting between VM-numbers and Haskell-numbers
----------------------------------------------------

pp_ii :: PP -> II
pp_ii I = II (S O) O
pp_ii (T n) = addI (II (S O) O) (pp_ii n)

-- convert PP to NN
pp_nn :: PP -> NN
pp_nn I = (S O)
pp_nn (T n) = S (pp_nn n)

-- convert NN to PP
nn_pp :: NN -> PP
nn_pp O = error "0 ≠ positive number"
nn_pp (S O) = I
nn_pp (S n) = T (nn_pp n)

-- Precondition: Inputs are non-negative

nn_int :: Integer -> NN
nn_int 0 = O
nn_int n = S (nn_int (n - 1))

int_nn :: NN -> Integer
int_nn O = 0
int_nn (S n) = 1 + int_nn n

ii_int :: Integer -> II
ii_int 0 = II (O) (O)
ii_int n = II  (nn_int(n)) (O)

int_ii :: II -> Integer
int_ii (II O O) = 0
int_ii (II (n) m) = int_nn(n) - int_nn(m)

-- Precondition: Inputs are positive

pp_int :: Integer -> PP
pp_int 1 = I
pp_int n = T (pp_int (n - 1))

int_pp :: PP->Integer
int_pp I = 1
int_pp (T n) = (int_pp n) + 1

float_qq :: QQ -> Float
float_qq (QQ n m) = fromInteger(int_ii n) / fromInteger(int_pp m)

----------
-- Testing
----------
main = do
    -- Integers: (II i j) represents i-j, (II k l) represents k-l
    let i = 4
    let j = 2
    let k = 1
    let l = 3

    print $ int_ii (addI (II (nn_int i) (nn_int j)) (II (nn_int k) (nn_int l)))
    print $ int_ii (multI (II (nn_int i) (nn_int j)) (II (nn_int k) (nn_int l)))

    -- Fractions: (QQ i j) represents i/j, (QQ k l) represents k/l
    print $ float_qq (addQ (QQ (ii_int i) (pp_int j)) (QQ (ii_int k) (pp_int l)))
    print $ float_qq (multQ (QQ (ii_int i) (pp_int j)) (QQ (ii_int k) (pp_int l)))
    
    -- Normalisation (recursive definition)
    print $ normalizeI (II (nn_int i) (nn_int j))

    -- Normalisation (by evaluation)
    print $ nbv (II (nn_int i) (nn_int j))