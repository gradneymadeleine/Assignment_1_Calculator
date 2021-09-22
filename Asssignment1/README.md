# Assignment 1
## Summary

The objective of this assignment was to 1) implement addP in arithmetic.hs

Note: Sorry for not re-updating this GitHub throughout the process. I had some confusion looking for a partner.

## Identifying Information
* Name: Scott Fitzpatrick
* Student ID: 2328196
* Email: sfitzpatrick@chapman.edu
* Course: CPSC 354
* Assignment: 1

## Date: September 21, 2021

## Accomplishments & Difficulties
All tasks for deadline 1 are complete. I had difficulty getting a feel for Haskell syntax as well as going from concrete syntax to abstract syntax. The basic concepts I found to be somewhat simple, but seeing it in a new way made the process much more of a challenge.

## Testing Process
For the arithmetic.hs portion of the assignment, I tried to play with the code and observe the console as much as possible to avoid getting stuck. In "main=do", I used "print $" to observe my changes to the code. For the calculator portion I simply tested using, "echo "10-4" | ./Calculator". I did other calculations other than 10-4 too.

## What Was Learned/Observations
I generally got an initial feel of working with Haskell. I learned about the importance of understanding abstract syntax and that I will need to improve in this aspect. I also learned how to compile with bnfc and how a numbers.cf file works.

# Assignment Connection With Theory
When making the addP function I was referencing the addN function. The biggest difference between the two was that O represented 0 for addN while addP had no variable that represented 0. Since this was the case, I could not use "add O m = m" (0+m = m). Instead, it was necessary to use: "addP I m = T m" (1+m = successor of m) to ensure that a fraction would have a denominator >= 1.

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
* echo "10-4" | ./Calculator
