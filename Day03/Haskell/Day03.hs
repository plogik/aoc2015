type Point = (Int, Int)

nextPoint :: Point -> Char -> Point
nextPoint (x, y) c
        | c == '^' = (x, y + 1)
        | c == 'v' = (x, y - 1)
        | c == '>' = (x + 1, y)
        | c == '<' = (x - 1, y)

solvePt1 :: String -> Int
solvePt1 (x:xs) = go (x:xs) (0, 0) []
    where go [] _ ps = length ps
          go (c:cs) p ps
              | elem next ps = go cs next ps
              | otherwise = go cs next (next:ps)
                where next = nextPoint p c

-- Not so gooda lookin eh?
solvePt2 :: String -> Int
solvePt2 (x:xs) = go (x:xs) (0, 0) (0, 0) [] True
    where go [] _ _ ps _ = length ps
          go (c:cs) santaPos roboPos visited santasTurn
              | elem next visited =
                    if(santasTurn) 
                        then do
                            go cs next roboPos visited False
                        else do
                            go cs santaPos next visited True
              | otherwise =
                    if(santasTurn)
                        then do
                            go cs next roboPos (next:visited) False
                        else do
                            go cs santaPos next (next:visited) True
                where next = nextPoint (if santasTurn then santaPos else roboPos) c

-- Even uglier version
solvePt2v2 :: String -> Int
solvePt2v2 (x:xs) = go (x:xs) (0, 0) (0, 0) [] True
    where go [] _ _ ps _ = length ps
          go (c:cs) santaPos roboPos visited santasTurn
              | santasTurn && elem nextSantaPos visited = go cs nextSantaPos nextRoboPos visited False
              | not santasTurn && elem nextRoboPos visited = go cs nextSantaPos nextRoboPos visited True
              | santasTurn = go cs nextSantaPos nextRoboPos (nextSantaPos:visited) False 
              | otherwise = go cs nextSantaPos nextRoboPos (nextRoboPos:visited) True 
                where nextSantaPos = if santasTurn then (nextPoint santaPos c)  else santaPos
                      nextRoboPos = if santasTurn then roboPos  else (nextPoint roboPos c)


main = do
    contents <- readFile "../input.txt"
    putStrLn $ "Pt1:" ++ show (solvePt1 contents)
    putStrLn $ "Pt2:" ++ show (solvePt2 contents)
    putStrLn $ "Pt2:" ++ show (solvePt2v2 contents)
