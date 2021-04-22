import Test.Tasty
import Test.Tasty.SmallCheck as SC
import Test.Tasty.QuickCheck as QC
import Test.Tasty.HUnit

import Data.List
import Data.Ord

import qualified BellTests (tests)

main = defaultMain tests

tests :: TestTree
tests = testGroup "Tests" [unitTests]


unitTests = testGroup "Unit tests" [ 
    BellTests.tests
  ] 