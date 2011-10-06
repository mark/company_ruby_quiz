### Problem

The digital root of a number is the (single digit) value obtained by an iterative process of summing digits, on each iteration using the result from the previous iteration to compute a digit sum. The process continues until a single-digit number is reached.

For example, the digital root of `65,536` is `7`, because `6 + 5 + 5 + 3 + 6 = 25` and `2 + 5 = 7`.

The digital root of of an array of numbers can be calculated similarly.  Using a similar example to the above, the digital root of `[ 6, 55, 3, 6 ]` is also `7`.

Please determine which subsets of [ 1, 2, 3, 4, 5, 6, 7, 8 ] meet ALL of the following properties:

(1) Contain between 3 and 5 elements.
(2) Contain the number 5.
(3) Have a digital root of 9.

### Test

For this problem, please don't use any Ruby libraries except the Ruby standard libraries.

This directory contains `nonary_game.rb` and `nonary_game_test.rb`.  Please implement the methods in `nonary_game.rb` so that all of the tests in `nonary_game_test.rb` pass when the following command is executed:

    ruby nonary_game_test.rb

---

Some text excerpted from [Wikipedia](http://en.wikipedia.org/wiki/Digital_root).  Problem from the Nintendo DS game 999.
