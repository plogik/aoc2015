import Data.List
import Data.List.Split

parseInputLine :: String -> [Int]
parseInputLine s = sort . map read $ splitOn "x" s

sumPt1 :: [Int] -> Int
sumPt1 (x1:x2:x3:xs) =
    (2 * x1 * x2) +
    (2 * x1 * x3) +
    (2 * x2 * x3) +
    (x1 * x2)

solvePt1 :: [String] -> Int
solvePt1 [] = 0
solvePt1 (x:xs) = go (x:xs) 0
    where go [] n = n
          go (x:xs) n = go xs $ n + sumPt1 (parseInputLine x)

sumPt2 :: [Int] -> Int
sumPt2 (x1:x2:x3:xs) =
    2 * x1 +
    2 * x2 +
    x1 * x2 * x3

solvePt2 :: [String] -> Int
solvePt2 [] = 0
solvePt2 (x:xs) = go (x:xs) 0
    where go [] n = n
          go (x:xs) n = go xs $ n + sumPt2 (parseInputLine x)

main = do
    contents <- readFile "../input.txt"
    let resultPt1 = solvePt1 $ lines contents
    let resultPt2 = solvePt2 $ lines contents
    putStrLn $ show resultPt1
    putStrLn $ show resultPt2


