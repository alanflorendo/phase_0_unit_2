# U2.W4: Create Accountability Groups


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:  a list of students
# Output:  a hash of those students with accountability groups
# Steps:

# Create a function to create an accountability group hash based on an array of students
def new_ag_bracket(students)
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




# 4. Refactored Solution








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


