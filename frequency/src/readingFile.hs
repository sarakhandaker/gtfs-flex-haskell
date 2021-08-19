import System.IO

main :: IO ()
main = do
   file <- openFile "./spec/Flex_v2_Example_1/stops.txt" ReadMode
   firstLine <- hGetLine file
   putStrLn firstLine
   secondLine <- hGetLine file
--    goodbyeFile <- openFile "goodbye.txt" WriteMode
--    hPutStrLn goodbyeFile secondLine
   hClose file
--    hClose goodbyeFile
   putStrLn "done!"




-- calculate the frequency of each route (trips/hour)
-- group routes into three buckets (frequent, moderate and not frequent) (<15 min, 15-1 hour, > 1 hour)

-- do the same for distance after