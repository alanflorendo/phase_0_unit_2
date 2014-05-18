# U2.W4: Create Accountability Groups


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:  a list of students
# Output:  a hash of those students with accountability groups
# Steps:

# Create a function to create an accountability group hash based on an array of students
	# Create a variable (best_grp_size) to hold the programmer-defined best group size, here 4
	# Create a variable (num_extra_students) to hold the number of students left after assigning 
	# => AGs of best group size
	# Create a new hash (ag_hash) to hold students (keys) and AG numbers (values)

	# Create an ordered list of AG#s repeated an appropriate number of times (to be randomized later)
	# => ie, if 20 students, an array of [1,1,1,1,2,2,2,2... 5,5,5,5]
		# Create new array called ag_numbers
		# Create new variable (num_ags) and set equal to #students / best_grp_size
		# Fill in ag_numbers array with round number of students (eg, first 20 out of 23 students)
			# FOR each ag (1..num_ags) 
				# FOR each student in group (1..best_grp_size)
					# Add the ag to the ag_numbers array
		# Fill in ag_numbers array with remaining students (eg, last 3 of 23 students)
			# Create new variable (ag_counter) and set equal to 1
			# FOR each remaining student (1..num_extra_students)
				# Add a new single instance of ag_counter to the ag_numbers array
				# Increment ag_counter by 1

	# Randomize list of students by creating a hash of students (keys) 
	# => and random numbers (values)
		# Create a new hash called ag_random
		# For each ag (0...#students)
			# Assign the student as the ag_random hash key
			# Assign a random number (0..1000) as the ag_random hash value
		# Sort the hash by the random values
		# Create a new, empty array called random_student_list
		# Create a new variable (random_student_list_counter) and set equal to zero
		# For each pairing in the ag_random hash, 
			# Assign the hash key (the group number) to the current place in the random_student_list array
			# Increment the random_student_list_counter

	# Assign randomized AG#s to each student, by filling in the ag_hash hash with the random_student_list array
	# (as keys) and the ag_numbers array (as values)
		# Create new variable, both_arrays_counter, set equal to zero
		# For each student in the random_student_list
			# Create a new hash pairing
			# Using both_arrays_counter as an index, set the hash key as the currently indexed
			# student in the students array and the hash value as the currently indexed ag# in the random_ag_list
			# Increment both_arrays_counter

# Create a function to return the smallest accountability group in a hash
	# Create a hash of hash_for_stats values (as keys) and num_occurrences (as values)
	# Determine the minimum number of occurrences

# Create a function to return the largest accountability group in a hash
	# Create a hash of hash_for_stats values (as keys) and num_occurrences (as values)
	# Determine the minimum number of occurrences



# 3. Initial Solution

=begin
def new_ag_bracket(students)

	# Create a variable (best_grp_size) to hold the programmer-defined best group size, here 4
	best_grp_size = 4
	# Create a variable (num_extra_students) to hold the number of students left after assigning 
	# => AGs of best group size
	num_extra_students = students.length % best_grp_size
	# Create a new hash (ag_hash) to hold students (keys) and AG numbers (values)
	ag_hash = Hash.new("")

	# Create an ordered list of AG#s repeated an appropriate number of times (to be randomized later)
	# => ie, if 20 students, an array of [1,1,1,1,2,2,2,2... 5,5,5,5]
		# Create new array called ag_numbers
		ag_numbers = []
		# Create new variable (num_ags) and set equal to #students / best_grp_size
		num_ags = students.length / best_grp_size
		# Fill in ag_numbers array with round number of students (eg, first 20 out of 23 students)
			# FOR each ag (1..num_ags) 
			for i in 1..num_ags
				# FOR each student in group (1..best_grp_size)
				for j in 1..best_grp_size
					# Add the ag to the ag_numbers array
					ag_numbers[ag_numbers.length] = i
				end
			end
		# Fill in ag_numbers array with remaining students (eg, last 3 of 23 students)
			# Create new variable (ag_counter) and set equal to 1
			ag_counter = 1
			# FOR each remaining student (1..num_extra_students)
			for i in 1..num_extra_students
				# Add a new single instance of ag_counter to the ag_numbers array
				ag_numbers[ag_numbers.length] = ag_counter
				# Increment ag_counter by 1
				ag_counter += 1
			end



	# Randomize list of students by creating a hash of students (keys) 
	# => and random numbers (values)
		# Create a new hash called ag_random
		ag_random = Hash.new
		# For each ag (0...#students)
		for i in 0...students.length
			# Assign the student as the ag_random hash key
			# Assign a random number (0..1000) as the ag_random hash value
			ag_random[students[i]] = Random.new.rand(0..1000)
		end
		# Sort the hash by the random values
		ag_random = ag_random.sort_by { |k, v| v }
		# Create a new, empty array called random_student_list
		random_student_list = []
		# Create a new variable (random_student_list_counter) and set equal to zero
		random_student_list_counter = 0
		# For each pairing in the ag_random hash, 
		ag_random.each do |k, v|
			# Assign the hash key (the group number) to the current place in the random_student_list array
			random_student_list[random_student_list_counter] = k
			# Increment the random_student_list_counter
			random_student_list_counter += 1
		end


	# Assign randomized AG#s to each student, by filling in the ag_hash hash with the random_student_list array
	# (as keys) and the ag_numbers array (as values)
		# Create new variable, both_arrays_counter, set equal to zero
		both_arrays_counter = 0
		# For each student in the random_student_list
		random_student_list.each do |student|
			# Create a new hash pairing
			# Using both_arrays_counter as an index, set the hash key as the currently indexed
			# student in the students array and the hash value as the currently indexed ag# in the random_ag_list
			ag_hash[student] = ag_numbers[both_arrays_counter]
			# Increment both_arrays_counter
			both_arrays_counter += 1
		end
		ag_hash = ag_hash.sort_by { |k, v| k }

		return ag_hash

end

# Create a function to return the smallest accountability group in a hash
def hash_value_min(hash_for_stats)
	# Create a hash of hash_for_stats values (as keys) and num_occurrences (as values)
	occurrences = Hash.new(0)
	min_value = 0
	hash_for_stats.each do |k, v|
		occurrences[v] += 1
	end

	# Determine the minimum number of occurrences
	return occurrences.values.min
end

# Create a function to return the largest accountability group in a hash
def hash_value_max(hash_for_stats)
	# Create a hash of hash_for_stats values (as keys) and num_occurrences (as values)
	occurrences = Hash.new(0)
	max_value = 0
	hash_for_stats.each do |k, v|
		occurrences[v] += 1
	end

	# Determine the minimum number of occurrences
	return occurrences.values.max
end

=end #end of commented-out initial solution











# 4. Refactored Solution

def new_ag_bracket(students)

	# Create a variable (best_grp_size) to hold the programmer-defined best group size, here 4
	best_grp_size = 4
	# Create a variable (num_extra_students) to hold the number of students left after assigning 
	# => AGs of best group size
	num_extra_students = students.length % best_grp_size
	# Create a new hash (ag_hash) to hold students (keys) and AG numbers (values)
	ag_hash = Hash.new("")

	# Create an ordered list of AG#s repeated an appropriate number of times (to be randomized later)
	# => ie, if 20 students, an array of [1,1,1,1,2,2,2,2... 5,5,5,5]
		# Create new array called ag_numbers
		ag_numbers = []
		# Create new variable (num_ags) and set equal to #students / best_grp_size
		num_ags = students.length / best_grp_size
		# Fill in ag_numbers array with round number of students (eg, first 20 out of 23 students)
			# FOR each ag (1..num_ags) 
			for i in 1..num_ags
				# FOR each student in group (1..best_grp_size)
				for j in 1..best_grp_size
					# Add the ag to the ag_numbers array
					ag_numbers[ag_numbers.length] = i
				end
			end
		# Fill in ag_numbers array with remaining students (eg, last 3 of 23 students)
			# Create new variable (ag_counter) and set equal to 1
			ag_counter = 1
			# FOR each remaining student (1..num_extra_students)
			for i in 1..num_extra_students
				# Add a new single instance of ag_counter to the ag_numbers array
				ag_numbers[ag_numbers.length] = ag_counter
				# Increment ag_counter by 1
				ag_counter += 1
			end

		# Randomize list of students by shuffling the array 
		random_students = students.shuffle

		# Assign randomized AG#s to each student, by filling in the ag_hash hash with the random_student_list array
		# (as keys) and the ag_numbers array (as values)
		index = 0
		random_students.each do |student|
			ag_hash[student] = ag_numbers[index]
			index += 1
		end
		# Sort array by students
		ag_hash = ag_hash.sort_by { |k, v| k }

		return ag_hash

end

# Create a function to return the smallest accountability group in a hash
def hash_value_min(hash_for_stats)
	# Create a hash of hash_for_stats values (as keys) and num_occurrences (as values)
	occurrences = Hash.new(0)
	min_value = 0
	hash_for_stats.each do |k, v|
		occurrences[v] += 1
	end

	# Determine the minimum number of occurrences
	return occurrences.values.min
end

# Create a function to return the largest accountability group in a hash
def hash_value_max(hash_for_stats)
	# Create a hash of hash_for_stats values (as keys) and num_occurrences (as values)
	occurrences = Hash.new(0)
	max_value = 0
	hash_for_stats.each do |k, v|
		occurrences[v] += 1
	end

	# Determine the minimum number of occurrences
	return occurrences.values.max
end






# 1. DRIVER TESTS GO BELOW THIS LINE
students = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", 
	"m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

puts "Test 1:  Test Group 1 for minimum size of 4"
puts "#{hash_value_min(new_ag_bracket(students)) >= 4}"

puts "Test 2:  Test Group 2 for minimum size of 4"
puts "#{hash_value_min(new_ag_bracket(students)) >= 4}"

puts "Test 3:  Test Group 3 for minimum size of 4"
puts "#{hash_value_min(new_ag_bracket(students)) >= 4}"

puts "Test 1:  Test Group 1 for maximum size of 6"
puts "#{hash_value_min(new_ag_bracket(students)) <= 6}"

puts "Test 2:  Test Group 2 for maximum size of 6"
puts "#{hash_value_min(new_ag_bracket(students)) <= 6}"

puts "Test 3:  Test Group 3 for maximum size of 6"
puts "#{hash_value_min(new_ag_bracket(students)) <= 6}"






# 5. Reflection 

=begin
I found the driver code particularly challenging here, as we seemed to jump from reading simple driver code 
(e.g., test that the mean of [4,5,6] is 5) to this much more complext assignment.  Here, there is not going
to be a correct set of accountability groups, just an effectively infinite set of solutions with correct 
characteristics.  I had a hard time identifying what those characteristics would be.  I chose just the minimum
and maximum sizes for a given group of 26 students.  I had wanted to test for the variety of students a given
student would work with based on the accountability groups, and I developed some test code, but I couldn't
get it to work.  Someday, maybe.
=end
