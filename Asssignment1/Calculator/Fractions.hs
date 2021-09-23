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

