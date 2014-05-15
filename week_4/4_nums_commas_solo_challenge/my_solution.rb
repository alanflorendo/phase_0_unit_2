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
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?


# 2. Initial Solution




# 3. Refactored Solution



# 4. Reflection 