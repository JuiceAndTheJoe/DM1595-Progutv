# DM1595 JavaScript exercises

Your task is to (individually) program the data model (including application logic) for a "dinner planner" use case. The data model contains the abstract data of an interactive application, e.g. the non-graphical part.

The application logic is:
- the dinner may have 1 or more guests, the default should be 2
- only one dish of a certain type (starter, main course, dessert, etc) can exist in the menu

Possible dishes and ingredients are stored in an array constant. You need to implement dish search and retrieval functionality (the DishSource object).

To implement DinnerModel and DishSource, you only need to modify [js/DinnerModel.js](/js/DinnerModel.js). 

All of your functions must have a name and the callback names must be suffixed with CB. 

The tests are provided for your convenience. Passing the tests is only the first step of passing the lab. You must be able to explain your code and the code may still be problematic in other ways that are not covered by the tests. 

Hint: work in the order required by the tests! They are designed in increasing complexity order

For troubleshooting, make sure to use the browser developer tools, which you can access by pressing F12 or Ctrl-Shift-i. Set a breakpoint at or before the line of code that fails.

When you are done with a lab, submit your KTH Git repository URL as answer to the Canvas assignment.

## Testing

Open `index.html` in the browser and tests should run automatically

Tests marked *W1* must pass during the JavaScript first week. Week 1 introduces simple imperative JS (statements) and functional JS (callbacks, filter, array spreading)

Tests marked *W2* must pass during the second JavaScript week. Week 2 is focused on removing imperative code with functional programming (function chaining, reduce, etc)

Tests marked Advanced(bonus) give one bonus each.

## Asking for Help

We maintain a git issues queue at [link](https://gits-15.sys.kth.se/iprog/js-issues/issues). In order to request help during a lab session, create a new git issue there and a TA will join your Zoom room during lab times. We may answer outside lab times as well, but only if your issue is well documented. For more instructions on how to properly create a git issue, refer to [link](https://gits-15.sys.kth.se/iprog/js-issues)

## What's in this repo
-----

* [index.html](/index.html) - open to run the tests. 
* [js/DinnerModel.js](/js/DinnerModel.js) - write code here. This is a skeleton for the model of the application, but it does not yet support the functionality needed (number of guests, selected dishes, et.c.).
* [js/dishesConst.js](/js/dishesConst.js) - a dummy hardcoded "database" to use as test data. Tests work with dishes 1, 2 and 100, you can modify the other dishes if you want to test more
* [test/dinnerModel.test.js](/test/dinnerModel.test.js) - tests for the model. You do not need to modify these, but study how they are written. You might be asked to write more tests in the future. 

