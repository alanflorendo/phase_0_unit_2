# U2.W5: Die Class 1: Numeric


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:  
# Output:

# For the class Die itself, the input is a call to the new Class method in the Class object, and the output 
# => is a new object (the die).
# For the .sides method, the input is a call to the sides method of any die object, which outputs the number 
# => of sides for that die object.
# For the .roll method, the input is a call to the sides method of any die object, which oputs a random 
# => number between 1 and the number of sides for that die object.


# Steps:
# Create a new class Die
# Initialize Die with the number of sudes
	# Create a .sides method to return the number of sides of a given die
	# Create a .roll method to return a random number of a roll of the die, with 1 as the minimum and the
	# => number of sides of that die as the maximum



# 3. Initial Solution
=begin
class Die
  def initialize(sides)
    # code goes here
    # Initialize instance variable (@sides)
    @sides = sides
  end
  
  def sides
    # code goes here
    # sides method returns the number of sides
    return @sides
  end
  
  def roll
    # code goes here
    # return a random number between 1 and the number of sides
    random_roll =  Random.new.rand(1..@sides)
    return random_roll
  end
end
=end


# 4. Refactored Solution ==> Added error message to INITIALIZE

class Die
  def initialize(sides)
    # Initialize instance variable (@sides)
    @sides = sides
    if sides < 1
    	raise ArgumentError.new("The die must have a minimum of one side.")
    end
  end
  
  def sides
    # sides method returns the number of sides
    return @sides
  end
  
  def roll
    # return a random number between 1 and the number of sides
    return Random.new.rand(1..@sides)
  end
end

# d = Die.new(0)


# 1. DRIVER TESTS GO BELOW THIS LINE

# Test 1:  Does .sides method return the appropriate number of sides?
	# test starts in a default of passing/true; then see if it fails the following code
	test_1_pass = true
	# Test the .sides method 10 times with random numbers
	10.times do
		num_sides = Random.new.rand(1..800)
		new_die = Die.new(num_sides)
		if new_die.sides != num_sides
			test_1_pass = false
		end
	end

	if test_1_pass == true
		print "T"
	else
		print "F"
	end

# Test 2:  Does the .roll method ever return a number greater than the number of sides?
	# test starts in a default of passing/true; then see if it fails the following code
	test_2_pass = true
	# Test the .roll method on 1000 new dice
	1000.times do
		num_sides = Random.new.rand(1..800)
		new_die = Die.new(num_sides)
		# Roll each new die 10 times to see if .roll exceeds the number of sides
		10.times do
			if new_die.roll > num_sides
				test_2_pass = false
			end
		end
	end

	if test_2_pass == true
		print "T"
	else
		print "F"
	end

# 5. Reflection

=begin
I think I have gotten the initial understanding of classes.  I get the basic syntax and have some idea
as to the power object-oriented programming unleashes.  But I am also not sure if I am just scratching 
the surface in terms of understanding even these simple problems.  I feel like I would do much better
seeing a more complex example to see how classes interact.  I also feel like more complex examples
would give me more opportunities to see logic and potential errors.
=end 