# U2.W4: Research Methods

i_want_pets = ["I", "want", 3, "pets", "but", "I", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, 
            "Annabelle" => 0, "Ditto" => 3}

# Person 1's solution
def my_array_finding_method(source, thing_to_find)
  # Your code here!
end

def my_hash_finding_method(source, thing_to_find)
  # Your code here!
end

# Identify and describe the ruby method you implemented. 
# 
#
#

# Person 2
def my_array_modification_method(source, thing_to_modify)
  # Your code here!
end

def my_hash_modification_method(source, thing_to_modify)
  # Your code here!
end

# Identify and describe the ruby method you implemented. 
# 
#
#


# Person 3
def my_array_sorting_method(source)
  # Convert each element in the array to a string, for comparison/sorting purposes
  for index in 0...source.length
		source[index] = source[index].to_s
	end

	sorted_array = source.sort_by do |element|
		element
	end

	return sorted_array
end

def my_hash_sorting_method(source)
  # Your code here!
	sorted_hash = source.sort_by do |key, value|
		value
	end

	return sorted_hash
end

# Identify and describe the ruby method you implemented. 
# The Ruby sort_by method lets you sort within your object, whether it is an array or a hash.  
# For an array, the syntax is quite basic:  
#     sorted_array = array_to_sort.sort_by { |element| element }
# And for the hash, just a tad more involved:
#     sorted_hash = source.sort_by { |key, value| value }


# Person 4
def my_array_deletion_method(source, thing_to_delete)
  #Your code here!
end

def my_hash_deletion_method(source, thing_to_delete)
  #Your code here!
end

# Identify and describe the ruby method you implemented. 
# 
#
#


################## DRIVER CODE ###################################
# HINT: Use `puts` statements to see if you are altering the original structure with these methods. 
# Each of these should return `true` if they are implemented properly.

p my_array_finding_method(i_want_pets, "t") == ["want","pets","but"]
p my_hash_finding_method(my_family_pets_ages, 3) == ["Hoobie", "Ditto"]
p my_array_modification_method(i_want_pets, 1) == ["I", "want", 4, "pets", "but", "I", "only", "have", 3 ]
p my_hash_modification_method(my_family_pets_ages, 2) == {"Evi" => 8, "Hoobie" => 5, "George" => 14, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}
p my_array_sorting_method(i_want_pets) == ["3", "4", "I", "but", "have", "only", "pets", "want"]
p my_hash_sorting_method(my_family_pets_ages) == [["Annabelle", 2], ["Ditto", 5], ["Hoobie", 5], ["Bogart", 6], ["Poly", 6], ["Evi", 8], ["George", 14]] 
# This may be false depending on how your method deals with ordering the animals with the same ages.
p my_array_deletion_method(i_want_pets, "a") == ["I", 4, "pets", "but", "I", "only", 3 ]
p my_hash_deletion_method(my_family_pets_ages, "George") == {"Evi" => 8, "Hoobie" => 5, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}

# Reflect!
=begin
My experience with methods is tempered by the fact that I misread the assignment.  Or rather, I read the 
directions to make the assignment much more complicated than it needed to be.  Instead of simply using 
Ruby’s sort_by method, I used Ruby’s .length method to program a sorting technique from scratch.  (Using 
that mistaken approach, I really learned the value of pseudocode and properly labeling variables.  At 
least for now, I believe erring on the side of lengthier content focuses the thought process.) 

As for exploring Ruby methods, I find myself somewhat more comfortable with the Ruby Docs than I was 
before I started the assignment.  If I suspect what the method does, then I can interpret the Ruby Docs 
pretty well; otherwise, it’s more of an issue.  And in either event, I find simply googling the method 
(or the problem which I hope to solve via method) tends to inform me better.
=end