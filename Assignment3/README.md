# Assignment 3

## Identifying Information
* Name: Scott Fitzpatrick
* Student ID: 2328196
* Email: sfitzpatrick@chapman.edu
* Name: Madeleine Gradney
* Student ID: 2298459
* Email: gradney@chapman.edu
* Course: CPSC 354
* Assignment: 3

## Date: December 8, 2021

## Accomplishments & Difficulties
All tasks for both deadlines are complete. For part one, we have difficulty with remove, sum, and prod. We had trouble converting the Haskell functions to the new syntax. We had many placement errors with variables in this process and simple syntax errors with '-'. We also initially had trouble testing as we did not know how to test the functions from the terminal. For part two, we are embarrased to say that we spent around an hour trying to find out why 'a' was undefined to learn that one of our lines of code was commented out. We learned that it is extra necessary to cautious about checking over code when there is no colorized fonts in .lc files.

Maddie's Tasks:
* Part 1: assignment2programs.lc: member, remove, sum, sort
* Part 2: round-robin.lc tasks: next, insert, update

Scott's Tasks:
* Part 1: assignment2programs.lc: prod, plus two, insert
* Part 2: round-robin tasks: get, delete

## Testing Process
To test the first part of the assignment, we loaded assignment2programs.lc with ":load test/assignment2programs.lc". After doing this, were able to test every function individually.

Here how we tested each individual function:
* member  : member 3 [4,3,5,7];;
* remove  : remove 3 [4,3,5,7];;
* sum     : sum [3,4,7];;
* prod    : prod [3,4,7];;
* plustwo : plustwo 4;;
* insert  : insert 3 [4,3,5,7];;
* sort    : sort [4,3,5,7];;

To test the second part of the assignment, we loaded round-robin.lc. We did this with ":load round-robin/round-robin.lc". This ran the "testAll" val which would print out true if the test ran correctly. We tested each function at a time, comenting out all of the others until they all worked.

## What Was Learned/Observations
We learned how to interact with the LambdaFun interface to load, reload, set languages, and more. We learned how functional programming langugages can be extended to an imperative programming language. For part one, we expanded our knowledge in pattern matching. Based on the provided examples, we were able to find patterns and translate our previous assignment into what was needed for this assignment. This was very helpful in translating our current knowledge to the new format. For part two, we explored while loops and pointers. We learned out to create "get" and utilize it within "insert" and "delete". 

## Assignment Connection With Theory
Within our round0robin functinos, we encountered sequential composition in multiple instances. For example, in "insert" and "delete" we used "let" and "in" to build a sequence of expressions into a single compound expression. This is necessary to control the order of evaluation, hence the name "sequential composition". 

## Build & Execution Instructions
### Part 1
* cd LambdaFun
* stack build
* stack exec lamfun
* :setLang LamMem
* :load test/assignment2programs.lc
* (Call whichever function desired. Samples are listed in the "Testing Process" section.)

### Part 2
* cd LambdaFun
* stack build
* stack exec lamfun
* :setLang LamMem
* :load round-robin/round-robin.lc