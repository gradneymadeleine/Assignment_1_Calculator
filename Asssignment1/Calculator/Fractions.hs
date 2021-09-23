--Natural Num

data NN = O | S NN
deriving (Eq,Show)

--addition
add :: NN -> NN -> NN
add O n = n
add (S n) m = S (add n m)

--sub
subtr :: NN -> NN -> NN
subtr O n = O
subtr n O = n
subtr (S n) (S m) = subtr n m

-- multi
mult :: NN -> NN -> NN
mult O n = O
mult (S O) n = n 
mult (S n) m = add m (mult n m)

--less n m if n < m
less :: NN ->  NN -> Bool
less n O = False
less O m = True
less (S n) (S m) = less n m

--Euclid alg, greatest common divisor
gcdN :: NN -> NN -> NN
gcdN O O = O
gcdN O n = n
gcdN n m | less n m ==False = gcdN m (subtr n m)
| less n m==True = gcdN n (subtr m n)


--Positive Num
data PN = I | T PN
deriving (Eq, Show)

--recursion o PN
--addition
addP :: PN -> PN -> PN
addP I n = (T n)
addP (T n) m = T

--sub
subtrNP :: NN -> PN -> NN
-- can't sub a (+) from 0
subtrNP O n = O
--(1+n)-1=n; base case
subtrNP (S n) I = n
subtrNP (S n) (T m) = subtrNP n m

--mult
multP :: PN -> PN -> PN
multP I n = n
multP (T n) m = addP m (mukltP n m)

--div
divP :: NN -> PN -> NN
divP n m = if n == (p2n m) then (S O)
else if (less n(p2n m)) then O
else (add (S O) (divP (subtrNP n m)m))

--n < m
lessP :: PN -> PN -> PN
-- n ≠ or > 0
lessP n I = False
-- I < 1
lessP I n = True
lessP (T n) (T m ) = lessP n m

--convert NN to PN
n2p :: NN -> PN
n2p 0 = error "0 ≠ positive number"
n2p (S O)= I
n2p (S n) = T(n2p n)


--Fractions

