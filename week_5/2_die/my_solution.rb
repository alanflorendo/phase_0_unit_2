# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:
# Output:
# Steps:

# Create a Die class
	# Create a .initialize method that will require the die to have at least one side
	# Create a .sides method that will return the number of sides (ie, the length of the array)
	# Create a .roll method that will return one of the die strings, chosen at random
		# Create a new variable (random_element_num), a random number from 1 to num_sides
		# Choose the element of the array at the random_element_num index slot

# 3. Initial Solution

class Die
  def initialize(labels)
  	@labels = labels
  	if labels.length < 1
  		raise ArgumentError.new("The die must contain at least one character string.")
  	end
  end

  def sides
  	return @labels.length
  end

  def roll
  	random_element_num = Random.new.rand(1..@labels.length)
  	return @labels[random_element_num-1]
  end
end

# d1 = Die.new(["Alan", "Gad", "Jenna", "Tracy", "Tina", "Jordan", "Jenna", "Marco"])
# puts "The initialize method takes #{d1.method(:initialize).arity} arguments"
# puts "The sides method takes #{d1.method(:sides).arity} arguments"
# puts "The roll method takes #{d1.method(:roll).arity} arguments"


# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE

# TEST 1:  Does .initialize take one and only one argument?
	test_1_passes = true  # default value
	d1 = Die.new(["a", "b", "c", "d"])
	if d1.method(:initialize).arity != 1
		test_1_passes = false
	end

	if test_1_passes == true
		print "T"
	else
		print "F"
	end

# TEST 2:  Does .roll take no arguments?
	test_2_passes = true # default value
	if d1.method(:roll).arity != 0
		test_2_passes = false
	end

	if test_2_passes == true
		print "T"
	else
		print "F"
	end

# TEST 3:  Does .sides take no arguments?
	test_3_passes = true # default value
	if d1.method(:sides).arity != 0
		test_3_passes = false
	end

	if test_3_passes == true
		print "T"
	else
		print "F"
	end





# 5. Reflection 
=begin
I fully admit that I need to work on refactoring.  Similarly I have trouble editing my own essays, 
though I find it helpful to wait a few days and come to it anew.  I find these particular challenges
on classes to be very simple (not that I don't need simplicity), and that makes creating good
refactoring habits very difficult.  I really have a hard time seeing where I might improve upon 
four lines of code (especially when I've adapted those lines from other already refactored code).

I am going to make an effort to do initial solutions earlier in the week, so that I can have time to 
think and reflect for a few days before going back to the refactoring.
=end