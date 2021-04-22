module BellTests (tests) where
import Test.Tasty
import Test.Tasty.HUnit

import System.IO
import Data.String
import Data.Char

import qualified Lib (trim, parseInput)


tests = testGroup "BellTests" [test1, test2, test3]

test1 = testCase "this is a test" $ do
    1 @?= 1

test2 = testCase "Can we read the file" $ do
    let list = []
    handle <- openFile "test/data/expectation_plain_hunt_minor.txt" ReadMode
    contents <- hGetContents handle
    print $ [ Lib.trim  x | x <-lines contents ]
    hClose handle

test3 = testCase "read fiile v2" $ do 
    dog <- Lib.parseInput "test/data/input_plain_hunt_minor.txt"
    print dog

