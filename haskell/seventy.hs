import Data.List

seventy :: [Int] -> [Int] -> [[Int]]
seventy l [] = [l | length l == 6 && sum l == 70]
seventy l (s:ss)
    | length l == 6 && sum l == 70 = [l]
    | length l >= 6 = []
    | sum l > 70 = []
    | otherwise = seventy l ss ++ seventy (l ++ [s]) ss

makeList :: Int -> [[Int]] -> [Char]
makeList _ [] = ""
makeList n (s:ss) = show n ++ " :" ++ joinList s ++ "\n" ++ makeList (n + 1) ss

joinList :: [Int] -> [Char]
joinList [] = ""
joinList (s:ss) = " " ++ show s ++ joinList ss
    

main = do
    putStr (makeList 1 (sort(seventy [] [1..45])))
