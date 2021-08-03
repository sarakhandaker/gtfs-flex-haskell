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