# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge by myself (solo challenge).

# 2. Pseudocode

# Input:  a call to initialize a new guessing game with a designated answer
# Output: a guessing game with the designated answer and methods allowing quick implementation of a 
# =>      guessing game program
# Steps:
# Create a new class (GuessingGame) with a parameter for a specified answer
	# METHOD:  Initialize the new game with the designated answer
	# =>       Create an instance variable (@is_solved) that assumes the game starts unsolved (set to false)

	# METHOD:  Create a guess method with a parameter of GUESS, the number being guessed
	# =>       Return :high if guess is too high, :low if too low, and :correct if equal to @answer
	# =>       If guess is correct, change value of @is_solved from false to true


# 3. Initial Solution
=begin
class GuessingGame
  def initialize(answer)
    # Your initialization code goes here
    @answer = answer
    @is_solved = false
  end
  
  # Make sure you define the other required methods, too
  def guess(guess)
  	if guess > @answer
  		return :high
  	elsif guess < @answer
  		return :low
  	else
  		@is_solved = true
  		return :correct
  	end
  end

  def solved?
  	if @is_solved == true
  		return true
  	else
  		return false
  	end
  end
  			
end

=end

# 4. Refactored Solution
class GuessingGame
  def initialize(answer)
    # Your initialization code goes here
    @answer = answer
    @is_solved = false
  end
  
  # Make sure you define the other required methods, too
  def guess(guess)
  	if guess > @answer
  		return :high
  	elsif guess < @answer
  		return :low
  	else
  		@is_solved = true
  		return :correct
  	end
  end

  def solved?
  	return @is_solved
  end
  			
end






# 1. DRIVER TESTS GO BELOW THIS LINE
game = GuessingGame.new(50)
puts game.guess(0)   == :low
puts game.guess(49)  == :low
puts game.guess(51)  == :high
puts game.guess(100) == :high
puts game.guess(50)  == :correct




# 5. Reflection 
=begin
I am beginning to see that everything in Ruby pretty much needs to be translated into objects and classes, even if
I think I can solve the problem without that structure.  First, I need the practice in these simpler projects so I 
can learn proper use of objects, class variables, and instance variables; that way, I can implement them later for 
projects that are so complex as to necessitate their use.  Second, I need to see that even if I can quickly implement
these solutions without using classes, I lose the flexibility that OOP provides.  OOP allows me to set up new objects
quickly, whether I need them for my program in general or just for driver testing.

I learned to be careful when to use a return statement.  For example, in one of my if/else branches, I needed two things 
to happen: (1) return the answer value to the user as "correct," and (2) return the value of "@is_solved" as true.  I coded
those two issues in that order, and my code was ineffective.  Coding the "return :correct" as the first step in my if/else
branch immediately terminated the branch and the second line of code would not execute.  
=end