# U2.W6: Drawer Debugger


# I worked on this challenge by myself.


# 2. Original Code

class Drawer

	attr_reader :contents

	# Are there any more methods needed in this class?

	def initialize
	@contents = []
	@open = true
	end

	def open
	@open = true
	end

	def close
	@open = false
	end 

	def add_item(item)  # added argument
	@contents << item
	end

	def remove_item(item = @contents.pop) #what is `#pop` doing?
										# .pop removes the last item of the @contents array
										# if no item is specified, the last item will be removed
	@contents.delete(item)
	end

	def dump  # what should this method return?
				# this method should return a drawer with no contents
				# (ie, @contents = [])
	puts "Your drawer is empty."
	@contents = []
	end

	def view_contents
	puts "The drawer contains:"
	@contents.each {|silverware| puts "- " + silverware.type }
	end
end  # end class

class Silverware
	attr_reader :type

	# Are there any more methods needed in this class?
	# Yes, need to add clean_silverware method

	def initialize(type, clean = true)
	@type = type
	@clean = clean
	end

	def eat
	puts "eating with the #{type}"
	@clean = false
	end

	def clean_silverware
		puts "The #{type} is now clean."
		@clean = true
	end

	def clean
		@clean
	end

end # end class

knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 
silverware_drawer.view_contents

silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware 

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return?
								# this method should return a drawer with no contents
								# (ie, @contents = [])


# fork = silverware_drawer.remove_item("fork") #add some puts statements to help you trace through the code...
silverware_drawer.remove_item("fork") 
# line 102 does not make sense: it sets the fork variable equal to a drawer that had a fork removed
# instead, a new fork object needs to be instantiated
fork = Silverware.new("fork")
fork.eat

#BONUS SECTION
 puts fork.clean
# I'm not sure what this code is intended to do.  I read it as printing the cleanliness status of the fork 
# itself, after eating.  Since the fork has just been used to eat with, the fork is not clean.  Hence, 
# the code puts "false" (ie, not clean) to the screen.

# DRIVER TESTS GO BELOW THIS LINE
def assert(test,false_msg)
	if test
		puts "True"
	else
		puts false_msg
	end
end

puts "\n\nDriver Code Tests"
puts "*********************"
assert(fork.clean==false, "Error:  fork.clean should equal false")
assert(silverware_drawer.view_contents==[], "Error:  silverware_drawer should be empty")
spoon1 = Silverware.new("spoon")
fork1 = Silverware.new("fork")
silverware_drawer.add_item(spoon1)
silverware_drawer.add_item(fork1) 
silverware_drawer.view_contents
knife1 = Silverware.new("knife")

assert(silverware_drawer.view_contents==[spoon1, fork1], 
	"Error: silverware_drawer should contain a spoon and fork")


# 5. Reflection 
=begin
I am starting to get the hang of classes and objects.  I think a problem with learning them is that I need 
to deal with simpler problems in order to learn to work with objects and classes.  But I also need a more 
complex problem in order to understand the basic workings of objects and classes.  This problem fell some-
where in between: I can see how we build classes and objects and how we can make them work together.  The 
view_contents method even seemed to make sense.  But at the same time, I can't see what the point of the
exercise really was.
=end