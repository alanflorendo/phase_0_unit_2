# U2.W4: Pad an Array

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge by myself.

# 1. Pseudocode

# What is the input?
# The input is an array, the length it needs to be padded to, and the (optional) value used to pad.
# What is the output? (i.e. What should the code return?)
# The output is the padded array, whether a new one or a destructed one.
# What are the steps needed to solve the problem?
# So long as the array is not long enough, then add the (optional) pad value to the
# end of the array, one at a time.



# 2. Initial Solution
class Array

	def pad! (needed_length, pad_value=nil)
		while self.length < needed_length
			self << pad_value
		end
		self
	end

	def pad (needed_length, pad_value=nil)
		new_array = self.dup
		while new_array.length < needed_length
			new_array << pad_value
		end
		return new_array
	end
end


# 3. Refactored Solution
=begin
I am really happy with my pad! method.  It works, and it is extremely clean and readable.  Accordingly I will not
refactor it.  I will also not refactor pad, though it looks slightly less clean.  I cannot, however, see any way to 
improve upon it.  And it does work.  (I assume there is some way to make pad! work using pad, but I am not going
there right now.)
=end


# 4. Reflection 
=begin
I was surprised at how quickly the coding came to me here.  Instead, the greater problem was figuring out
how to use a dot-method instead of simply a procedural method called seapately.  Simply put, google to the rescue.
=end
