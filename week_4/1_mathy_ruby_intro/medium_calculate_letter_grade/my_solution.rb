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
=begin
I decided not to refactor.  The solution is clean, readable, and effective.

I considered changing the format of the case statement to an if/else series, but I think the case statement 
reads cleaner.  I also considered accounting for possibilities with negative grades or grades over 100.  
These could be mistakes, or there could be reasons for having such grades, so I decided that this issue
was beyond the scope of the exercise.
=end


# 4. Reflection 
=begin

This solution worked out well for me.  It worked on the first time and boosted my confidence after the last
"easy" problem, where I just had to keep reediting my code and pseudocode to correct for small mistakes.
This problem made me realize that I need to focus on the actual code as I write the pseudocode.  That is, 
I don't inlcude the code as I pseudocode, but I do think precisely about what the coding options are for
the particular line of pseudocode.  What are the alternatives, and how might I do this?  Later, when I am 
converting the pseudocode into code, those prior reflections are very helpful.

=end