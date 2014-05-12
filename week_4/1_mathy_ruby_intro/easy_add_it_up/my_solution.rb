# U2.W4: Add it up!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

# 1. Pseudocode

# What is the input?
# For each of the two functions the input is an array: an array of numbers for the total method and
# an array of strings for the sentence_maker method.

# What is the output? (i.e. What should the code return?)
# The total method will return a sum of the members of the inputted array.
# The sentence_maker method will return a concatenated sentence, made of the members of the inputted array.

# What are the steps needed to solve the problem?
# Create total method with single argument: array_to_total
	# Declare new sum variable and set to zero
	# For each member of array_to_total, add to the sum variable
	# Return the sum variable

# Create sentence_maker method with single argument: array_of_strings
	# Declare new sentence variable and set to ""
	# For each member of array_of_strings, add to the sentence variable (converting to string)
		# if the member of the array is the first member of array_of_strings, capitalize it
		# if not, then don't capitalize it
		# unless the member of the array is the last member of array_of_strings_, add a space after the word
	# End the sentence variable with a period
	# Return the sentence variable




# 2. Initial Solution
# Create total method with single argument: array_to_total
def total(array_to_total)
	# Declare new sum variable and set to zero
	sum = 0
	# For each member of array_to_total, add to the sum variable
	array_to_total.each do |x|
		sum += x
	end
	# Return the sum variable
	return sum
end


# Create sentence_maker method with single argument: array_of_strings
def sentence_maker(array_of_strings)
	# Declare new sentence variable and set to ""
	sentence = ""
	# For each member of array_of_strings, add to the sentence variable (converting to string)
	for num in 0..(array_of_strings.length - 1)
		# if the member of the array is the first member of array_of_strings, capitalize it
		if num == 0
			sentence += array_of_strings[0].to_s.capitalize
		# if not, then don't capitalize it
		else 
			sentence += array_of_strings[num].to_s
		end
		# unless the member of the array is the last member of array_of_strings_, add a space after the word
		unless num == (array_of_strings.length - 1)
			sentence += " "
		end
	end
	# End the sentence variable with a period
	sentence += "."
	# Return the sentence variable
	return sentence
end



# 3. Refactored Solution
# Leave total method as is; it is clean, readable, and functional.



puts sentence_maker(["all", "my", "socks", "are", "dirty"])
puts sentence_maker(["alaska", "has", "over", 586, "thousand", "miles"])

# 4. Reflection 