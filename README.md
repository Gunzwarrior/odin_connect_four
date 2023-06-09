This is my attempt at TOP's Ruby course Project : TDD Connect Four.

I'll build a working two player connect four game in the command line using TDD.

----
Code planning : 
----

Player Class :

- Exist to choose where to make a move
- Create pieces of the right color for each player

Board Class : 

- Gets filled by pieces
- Have methods for showing the board (reorganizing the arrays into columns containing the symbol for each piece)
- 7 columns / 6 rows
- Must have numbers under the columns on the board to help visualizing where to play
- Attributes with arrays which represent each columns with a fixed number of rows

Piece Class : 

- Exist only to have a "color" attribute and fill the board

Engine Class : 

- contains the other classes and handle the game loop
- Handles the interaction between different classes


Module for prompts and messages : 

- Intro
- End of game message (win, lose, draw)
- Errors

----
Guidelines on how and what to test : 
----

1. Arrange -> set up the test (examples: initializing objects, let
              variables, updating values of instance variables).
2. Act ->     execute the logic to test (example: calling a method to run).
3. Assert ->  expect the results of arrange & act.

describe -> Name of the method that is being tested.
context ->  Explains the conditions of the test.
it ->       Explains the results of the test.

In general, you probably have 4 different types of methods:
1. Command - Changes the observable state, but does not return a value.
2. Query - Returns a result, but does not change the observable state.
3. Script - Only calls other methods, usually without returning anything.
4. Looping Script - Only calls other methods, usually without returning
   anything, and stops when certain conditions are met.

Let's take a look at methods that should always be tested:

1. Public Command or Public Query Methods should always be tested, because
they are the public interface. Command Methods should test the method's action
or side effect. Query Methods should test the method's return value.

2. Command or Query Methods that are inside a public script or looping script
method should be tested. For the games that we are making, script and looping
script methods are just a convenient way to call the methods needed to play a
full game. Since these methods are required to play the game, they should be
tested and made public (even if you previously made them private). Pretend
that someone will be using your class to make their own game with customized
text. Any method that they would need in their game should be part of the
public interface and have test coverage.

3. Any method that sends a command message to another class should always test
that those messages were sent.

4. A Looping Script Method should test the behavior of the method. For
example, that it stops when certain conditions are met.

Here is a summary of what should be tested
1. Command Method -> Test the change in the observable state
2. Query Method -> Test the return value
3. Method with Outgoing Command -> Test that a message is sent
4. Looping Script Method -> Test the behavior of the method

There are a handful of methods that you do not need to test:

1. You do not have to test #initialize if it is only creating instance
variables. However, if you call methods inside the initialize method, you
might need to test #initialize and/or the inside methods. In addition, you
will need to stub any inside methods because they will be called when you
create an instance of the class.

2. You do not have to test methods that only contain 'puts' or 'gets'
because they are well-tested in the standard Ruby library.

3. Private methods do not need to be tested because they should have test
coverage in public methods. However, as previously discussed, you may have
some private methods that are called inside a script or looping script method;
these methods should be tested publicly.