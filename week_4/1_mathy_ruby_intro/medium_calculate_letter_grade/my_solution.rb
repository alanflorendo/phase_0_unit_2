# U2.W4: Calculate a letter grade!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge by myself.

# 1. Pseudocode

# What is the input?
# an array of numeric grades

# What is the output? (i.e. What should the code return?)
# a single letter grade

# What are the steps needed to solve the problem?

# Create get_grade method with a single argument (grades_array)
	# Determine the average of the grades
		# Set a new variable called grades_total to zero
		# Add each grade in grades_array to grades_total
		# New variable average = grades_total divided by the array-length of grades_array
	# Use case statement to convert the average to a letter grade



# 2. Initial Solution
# Create get_grade method with a single argument (grades_array)
def get_grade(grades_array)
	# Determine the average of the grades
		# Set a new variable called grades_total to zero
		grades_total = 0
		# Add each grade in grades_array to grades_total
		grades_array.each do |x|
			grades_total += x
		end
		# New variable average = grades_total divided by the array-length of grades_array		
		average_number = grades_total / grades_array.length
	# Use case statement to convert the average to a letter grade
	case average_number
	when 0...60
		return "F"
	when 60...70
		return "D"
	when 70...80
		return "C"
	when 80...90
		return "B"
	when 90...100
		return "A"
	end
end



# 3. Refactored Solution



# 4. Reflection 