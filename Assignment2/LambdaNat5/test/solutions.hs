-- member
member :: Int -> [Int] -> Int
member _ [] = 0
member element (x:xs) | element == x = 1 | otherwise = member element xs

-- remove
remove _ [] = []
remove x (y:ys) | x == y = remove x ys | otherwise = y : remove x ys

-- sum
sumList :: [Int] -> Int
sumList [] = 0
sumList (x:xs) = x + sumList xs

-- prod
prod :: [Int] -> Int
prod [] = 1
prod (x:xs) = x * prod xs

-- plus two
plus_two :: Int -> Int
plus_two x = x + 2

-- insert
insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys) | x < y = x:y:ys | otherwise = y:(insert x ys)

-- sort
sort :: Ord a => [a] -> [a]
sort [] = []
sort (x:xs) = insert x (sort xs)

main = do
    print $ (member 3 [1,2,3,4,5]);
    print $ (remove 3 [3,3,2,1,9,7,3]);
    print $ (sumList [1,2,4,8]);
    print $ (prod [1,2,4,8]);
    print $ (map plus_two [1,2,4]);
    print $ (sort [5,7,12,1,2,4,8]);