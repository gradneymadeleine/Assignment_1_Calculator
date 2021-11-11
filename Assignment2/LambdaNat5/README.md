# Assignment 2

## Identifying Information
* Name: Scott Fitzpatrick
* Student ID: 2328196
* Email: sfitzpatrick@chapman.edu
* Name: Madeleine Gradney
* Student ID: 2298459
* Email: gradney@chapman.edu
* Course: CPSC 354
* Assignment: 2

## Date: November 10, 2021

## Accomplishments & Difficulties
All tasks for each deadline are complete. We had difficulty with task 2 specifically. It was generally difficult to know where to begin. The structure that we created in solutions.ls did not feel intuitive at first. Task 3 was also difficult to start, but managed to finish it rather quickly once we understood the layout.

Maddie's Tasks:
* Part 2
* Part 3: 
** Task 1: evalCBN
** Task 2: member, insert, sort
** Task 3: member, remove, sum, prod,
Scott's Tasks:
* Part 1
* Part 3:
** Task 1: subst
** Task 2: prod, sum, maps, plus_two, remove
** Task 3: plus_two, map, insert, sort

## Testing Process
Writing tests took longer than anticipated. We had to obtain the mathmatical solutions to check that our functions were working properly. We had to know the answers before running the tests.

## What Was Learned/Observations
We learned to take educated guesses on how to write functional code. At this point in the semester, our intuition is better since we have more past experience. 

# Assignment Connection With Theory
In regards to Lambda Calculus, we learned much about the computational rules for natural numbers and that they should do a type of recursion. We also learned about computational rules versus universal properties. We also wrapped our minds further aorund the magic of recursion, thinking more deeply about how we pretend to know the definition of a function when it is simultaneously within itself. 

## Build & Execution Instructions
### solutions.lc Portion
* cd LambdaNat5
* cd grammar
* bnfc -m --haskell LambdaNat5.cf
* make
* cd ..
* cp grammar/*.hs src 
* stack build
* stack exec LambdaNat-exe test/solutions.lc

### solutions.hs Portion
* cd LambdaNat5
* cd test
* ghc solutions.hs -o solutions
* ghci solutions
* main