solvePt1 :: String -> Int -> Int
solvePt1 [] f = f
solvePt1 (x:xs) f
    | x == '(' = solvePt1 xs (f + 1)
    | otherwise = solvePt1 xs (f - 1)

solvePt1v2 :: String -> Int
solvePt1v2 xs = go xs 0
    where go [] n = n
          go (x:xs) n
            | x == '(' = go xs (n + 1)
            | otherwise = go xs (n - 1)

solvePt2 :: String -> Int
solvePt2 xs = go xs 0 0
    where go _ (-1) p = p
          go (x:xs) n p
            | x == '(' = go xs (n + 1) (p + 1)
            | otherwise = go xs (n - 1) (p + 1)

main = do
    contents <- readFile "../input.txt"
    putStrLn $ "Pt1:" ++ show (solvePt1v2 contents)
    putStrLn $ "Pt2:" ++ show (solvePt2 contents)
