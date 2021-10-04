# Assignment 1

## Identifying Information
* Name: Scott Fitzpatrick
* Student ID: 2328196
* Email: sfitzpatrick@chapman.edu
* Name: Madeleine Gradney
* Student ID: 2298459
* Email: gradney@chapman.edu
* Course: CPSC 354
* Assignment: 1

## Date: October 3, 2021

## Accomplishments & Difficulties
All tasks for each deadline are complete. We had difficulty getting a feel for Haskell syntax as well as going from concrete syntax to abstract syntax. The basic concepts we found to be somewhat simple, but seeing it in a new way made the process much more of a challenge. Once we had a better grasp of what we were doing, we found that writing the mathematical logic to be much prefered in Haskell. We had challenges with addQ and normalization. We found the calculator part easier to understand and get through vs the arithmetic and conversions.

Maddie's Tasks:
* Arithmetic Portion: NN Arithmetic, Multiplication QQ, add pp, converting pp_ii, pp_nn, nn_pp, nn_int, int_nn, float_qq
* Calculator Portion: Divide, Min, Max, Negate

//Scott's Tasks:
* Arithmetic Portion: II Arithmetic, subtract pp, multiply pp, mini, addQ, normalizeI, nbv, int_ii, ii_int, pp_int, int_pp
* Calculator Portion: Plus, Minus, Mod, Exponential

## Testing Process
For the arithmetic.hs portion of the assignment, we tried to play with the code and observe the console as much as possible to avoid getting stuck. In "main=do", we used "print $" to observe our changes to the code. For the most part, we used the given tests provided through the GitHub arithmetic template. For the calculator portion we simply tested using, "echo "10-4" | ./Calculator". We did other calculations other than 10-4 too.

## What Was Learned/Observations
We generally got an initial feel of working with Haskell. We learned about the importance of understanding abstract syntax and that we will need to improve in this aspect. we also learned how to compile with bnfc and how a numbers.cf file works. 

# Assignment Connection With Theory
When making the addP function we was referencing the addN function. The biggest difference between the two was that O represented 0 for addN while addP had no variable that represented 0. Since this was the case, we could not use "add O m = m" (0+m = m). Instead, it was necessary to use: "addP I m = T m" (1+m = successor of m) to ensure that a fraction would have a denominator >= 1.

## Build & Execution Instructions
### arithmetic.hs Portion
(Within the Assignment1 folder run the following)
* ghci
* :load arithmetic
* main

### Calculator Portion
(Navigate to the Calculator directory and run the following)
* bnfc -m --haskell numbers.cf
* make
* ghc Calculator.hs

Testing:
* echo "10 - 4" | ./Calculator
* echo "~ 5" | ./Calculator
* (The two above commands are for testing. Every operation requires a symbol and two variables, except for negation which only takes 1. Spaces should be used to separate variables and operators.)
* (For division and mod, please reference the examples below)
* echo "10 div 5" | ./Calculator
* echo "10 mod 5" | ./Calculator
