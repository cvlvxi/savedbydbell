module Lib (trim, parseInput)
where

import System.IO

import Data.String
import Data.Char
import Text.Read
import Data.Maybe

trim xs = dropSpaceTail "" $ dropWhile isSpace xs

dropSpaceTail maybeStuff "" = ""
dropSpaceTail maybeStuff (x:xs)
        | isSpace x = dropSpaceTail (x:maybeStuff) xs
        | null maybeStuff = x : dropSpaceTail "" xs
        | otherwise       = reverse maybeStuff ++ x : dropSpaceTail "" xs




parseInput :: String -> IO (Maybe MethodNotation)
parseInput fileName =  do
    handle <- openFile fileName ReadMode
    contents <- hGetContents handle
    let list = [ trim  x | x <-lines contents ]
    let operations = map parseLine list
    if all isJust operations
        then
            return (Just $ map fromJust operations)
        else
            return Nothing


data BellOperation =
    SwitchPairs |
    Hold [Int]
    deriving Show

type MethodNotation = [BellOperation]



parseLine :: String -> Maybe BellOperation
parseLine s
    | s == "x" = Just SwitchPairs
    | otherwise = let maybeNumbers = [ readMaybe number :: Maybe Int  | number <- words s ] in sequence maybeNumbers





    