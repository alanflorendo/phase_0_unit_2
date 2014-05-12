# U2.W4: Calculate the mode!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge by myself.

# 1. Pseudocode

# What is the input?
# input is an array of numbers

# What is the output? (i.e. What should the code return?)
# output is an array of mode(s) (the number(s) occurring most often in the input array)

# What are the steps needed to solve the problem?
# create a new method called mode, with single argument (input_array)
	# create a hash variable called occurrences, with a default value of zero
	# for each number in input_array, increment the value for that number key by 1
	# create a new variable called max_num_occurrences, equal to the occurrences of the first array value (default)
	# for each hash value, compare the hash value to max_num_occurrences, replacing if the hash value is greater
	# create a new variable mode_array
	# for each pairing in the hash, if the hash-value equals max_num_occurrences, add its key to hash_value_array
	# return mode_array

# 2. Initial Solution
=begin
# create a new method called mode, with single argument (input_array)
def mode(input_array)
	# create a hash variable called occurrences, with a default value of zero
	occurrences = Hash.new(0)
	# for each number in input_array, increment the value for that number key by 1
	input_array.each do |x|
		occurrences[x] += 1
	end

	# create a new variable called max_num_occurences, equal to the occurrences of the first array value (default) 
	max_num_occurrences = occurrences[input_array[0]]
	# for each hash value, compare the hash value to max_num_occurrences, replacing if the hash value is greater
	occurrences.each do |key, value|
		if value > max_num_occurrences
			max_num_occurrences = value
		end
	end
	# create a new variable mode_array
	mode_array = []
	counter = 0
	# for each pairing in the hash, if the hash-value equals max_num_occurrences, add its key to hash_value_array
	occurrences.each do |key, value|
		if value == max_num_occurrences
			mode_array[counter] = key
			counter += 1
		end
	end
	# return mode_array
	return mode_array
end
=end

# 3. Refactored Solution
# create a new method called mode, with single argument (input_array)
def mode(input_array)
	# create a hash variable called occurrences, with a default value of zero
	occurrences = Hash.new(0)
	# for each number in input_array, increment the value for that number key by 1
	input_array.each do |x|
		occurrences[x] += 1
	end
	# CREATE A NEW VARIABLE CALLED MAX_NUM_OCCURRENCES, EQUAL TO THE MOST TIMES ANY NUMBER(S) APPEAR(S)
	max_num_occurrences = occurrences.values.max
	
	# create a new variable mode_array
	mode_array = []
	counter = 0
	# for each pairing in the hash, if the hash-value equals max_num_occurrences, add its key to hash_value_array
	occurrences.each do |key, value|
		if value == max_num_occurrences
			mode_array[counter] = key
			counter += 1
		end
	end
	# return mode_array
	return mode_array
end


# 4. Reflection 
=begin

This challenge was significantly harder than the prior two, and I am proud I was able to complete both my initial solution
and my refactoring (brief as it was).  I initially considered not refactoring based on the idea that my Ruby was not strong 
enough.  A quick google search, however, got me the easy syntax I should have looked for in my initial solution.  That's
lesson #1:  google is an amazing resource for syntax (presumably for simple as well as complex, though that may be harder
to find).

I also used IRB as a debugging tool.  Though I am sure there are better debuggers, IRB was pretty effective for code this
simple.  I had not used IRB in the prior challenges this week, so this definitely put that tool back on my radar.  That's
lesson #2.

=end