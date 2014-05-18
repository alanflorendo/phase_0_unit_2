# U2.W4: Numbers to Commas Solo Challenge

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  


# 0. Driver Test Code
# Create new array variable test_summary to hold test results
test_summary = []

# TEST 0:  Test whether separate_comma is a method
if self.respond_to?('separate_comma') == true
	test_summary[0] = true
else
	puts 'Test 0 FAILS:  "separate_comma" is not defined as a method'
	test_summary[0] = false
end


# TEST 1:  Test 0
if separate_comma(0) == "0" 
	test_summary[1] = true
else
	puts 'Test 1 FAILS:  (separate_comma(0) does not return "0")'
	test_summary[1] = false
end


# TEST 2:  Test two-digit number
if separate_comma(24) == "24" 
	test_summary[2] = true
else
	puts 'Test 2 FAILS:  (separate_comma(24) does not return "24")'
	test_summary[2] = false
end


# TEST 3:  Test three-digit number
if separate_comma(100) == "100" 
	test_summary[3] = true
else
	puts 'Test 3 FAILS:  (separate_comma(100) does not return "100")'
	test_summary[3] = false
end


# TEST 4:  Test four-digit number
if separate_comma(1234) == "1,234" 
	test_summary[4] = true
else
	puts 'Test 4 FAILS:  (separate_comma(1234) does not return "1,234")'
	test_summary[4] = false
end


# TEST 5:  Test eight-digit number
if separate_comma(87654321) == "87,654,321" 
	test_summary[5] = true
else
	puts 'Test 5 FAILS:  (separate_comma(87654321) does not return "87,654,321")'
	test_summary[5] = false
end


# TEST 6:  Test 15-digit number
if separate_comma(123456789012345) == "123,456,789,012,345" 
	test_summary[6] = true
else
	puts 'Test 6 FAILS:  (separate_comma(123456789012345) does not return "123,456,789,012,345")'
	test_summary[6] = false
end


# TEST 7:  Test negative two-digit number
if separate_comma(-12) == "-12" 
	test_summary[7] = true
else
	puts 'Test 7 FAILS:  (separate_comma(-12) does not return "-12")'
	test_summary[7] = false
end


# TEST 8:  Test negative five-digit number
if separate_comma(-12345) == "-12,345" 
	test_summary[8] = true
else
	puts 'Test 8 FAILS:  (separate_comma(-12345) does not return "-12,345")'
	test_summary[8] = false
end


# TEST 9:  Test a decimal number between 0 and 1
if separate_comma(0.1234) == ".1234" 
	test_summary[9] = true
else
	puts 'Test 9 FAILS:  (separate_comma(0.1234) does not return ".1234")'
	test_summary[9] = false
end


# TEST 10:  Test a number over a million that also has decimals
if separate_comma(1000000.01) == "1,000,000.01" 
	test_summary[10] = true
else
	puts 'Test 2 FAILS:  (separate_comma(1000000.01) does not return "1,000,000.01")'
	test_summary[11] = false
end


# TEST 11:  Test a negative five-digit number with decimals
if separate_comma(-13579.2468) == "-13,579.2468" 
	test_summary[11] = true
else
	puts 'Test 11 FAILS:  (separate_comma(-13579.11468) does not return "-13,579.2468")'
	test_summary[11] = false
end


# PRINT TEST SUMMARY
print "Test Summary:  "
for i in 0...test_summary.length
	if test_summary[i] = true
		print "#{i}T   "
	else
		print "#{i}F   "
	end
end

# ****************************
# END OF DRIVER CODE
# ****************************


# 1. Pseudocode

# What is the input?
# The input is a number, formatted as a number (float or integer)
# What is the output? (i.e. What should the code return?)
# The method should return the same number as a string, formatted with commas
# What are the steps needed to solve the problem?


# Create a function to format a number with commas
		# Remove and track any decimal portion
			# Declare a new variable (has_decimal) and set equal to false
			# Declare a new variable (dec_string) and set equal to the portion of the string after the decimal

		# Convert non-decimal portion of number (string) to number (integer)

		# Remove and track sign of number
			# Declare a new variable (is_neg) and set to false
			# If base_num < 0
				# set is_neg equal to true and
				# remove the negative sign by multiplying by -1

		# Declare new variable (num_digits) equal to the number of digits (log base ten of the number, rounded down)

		# Declare a new variable (num_text) and set equal to an empty string

		# For each digit
			# Create a new variable (digit), equal to the base_number MINUS the base_number-rounded down to the ten's place
			# Insert the digit in front of the string of digits
			# If BOTH the iteration is evenly divisble by 3 AND we are not at the final digit
				# Then insert a comma in front of the string of digits
			# Before moving on to the next loop, cut off the one's place (do this by
			# => subtracting the digit and then dividing the remaining number by 10)

		# If original number was negative, append a minus sign to the front of the string number

		# If original number had a decimal portion, append it to the end of the string number

	# Return num_text





# 2. Initial Solution

# Create a function to format a number with commas
def separate_comma(given_num)
	base_num = given_num.to_s

	# **********************************
	# NOTE:  Number is treated initially
	# as a string
	# **********************************


	# **********************************
	# HARD CODE:  Return 0 for 0
	# Special Situation
	# **********************************

	if given_num == "0"
		return 0
	else

		# Remove and track any decimal portion
			# Declare a new variable (has_decimal) and set equal to false
			has_decimal = false

			if base_num.index(".") != nil
			# Declare a new variable (dec_string) and set equal to the portion of the string after the decimal
			# => (IE, the decimal portion equals the portion from the decimal point to the end of the string)
				dec_portion = base_num[base_num.index(".")..base_num.length]
				has_decimal = true
			end

	# **********************************
	# NOTE:  Convert number now from
	# STRING into DECIMAL
	# **********************************
		# Convert non-decimal portion of number (string) to number (integer)
		base_num = base_num.to_i

		# Remove and track sign of number
			# Declare a new variable (is_neg) and set to false
			is_neg = false
			# If base_num < 0
			if base_num < 0
				# set is_neg equal to true and
				is_neg = true
				# remove the negative sign by multiplying by -1
				base_num *= -1
			end

		# Declare new variable (num_digits) equal to the number of digits (log base ten of the number, rounded down)
		num_digits = (Math.log(base_num,10) + 1).to_i

		# Declare a new variable (num_text) and set equal to an empty string
		num_text = ""

		# For each digit
		for i in 1..num_digits
			# Create a new variable (digit), equal to the base_number MINUS the base_number-rounded down to the ten's place
			digit = base_num - ((base_num/10).to_i * 10)
			# Insert the digit in front of the string of digits
			num_text.insert(0, digit.to_s)
			# If BOTH the iteration is evenly divisble by 3 AND we are not at the final digit
			if (i % 3 == 0) && (i != num_digits)
				# Then insert a comma in front of the string of digits
				num_text.insert(0,",")
			end
			# Before moving on to the next loop, cut off the one's place (do this by
			# => subtracting the digit and then dividing the remaining number by 10)
			base_num = (base_num - digit) / 10
		end

		# If original number was negative, append it to the front of the string number
		if is_neg
			num_text.insert(0,"-")
		end

		# If original number had a decimal portion, append a minus sign to the end of the string number
		if has_decimal
			num_text += dec_portion.to_s
		end
	end

	# Return num_text
	return num_text

end




# 3. Refactored Solution



# 4. Reflection 