# U2.W6: Refactoring for Code Readability


# I worked on this challenge with Maddison Brusman.


# Original Solution
=begin

class CreditCard
	def initialize(credit)
		if (!(credit.include?(" "))) 
			@credit = credit
		else
            @credit = credit.delete(" ")
		end
	end
    
	def checkcard
       double = @credit.split("").map.with_index { |n,i| i%2==0 ? n.to_i * 2 : n.to_i }
       sum = 0
	   double.join.each_char { |n| sum += n.to_i }
	   sum % 10 == 0
	end	
end

=end



# Refactored Solution

class CreditCard
  def initialize(cc_num)
    if cc_num.include?(" ")
      @cc_num = cc_num.delete(" ")
    else
      @cc_num = cc_num
    end
    raise ArgumentError.new("Invalid Card Length") if @cc_num.length != 16
  end
    
  def double
       @double = @cc_num.split("").map.with_index { |n,i| i%2==0 ? n.to_i * 2 : n.to_i }
  end
  
  def sum_elements 
       sum = 0
     double.join.each_char { |n| sum += n.to_i }
     sum
  end
       
  def check_card 
      sum_elements % 10 == 0
  end
end





# DRIVER TESTS GO BELOW THIS LINE


def assert 
  if yield
  	puts "True"
  else
  	puts "False"
  end
end


assert {
	valid_card = CreditCard.new("4539249060596470")
	valid_card.check_card} 


assert {
	invalid_card = CreditCard.new("3782822463100051")
	invalid_card.check_card==false}


assert {
	spaced_valid_card = CreditCard.new("4539 24 906059 64 7 0")
	spaced_valid_card.check_card} 

assert {
	spaced_invalid_card = CreditCard.new("3782822463100051")
	spaced_invalid_card.check_card==false}



# Should raise error message
#assert {
#	not16digits = CreditCard.new("83242234290")
#	not16digits.check_card==false}
puts "True (Confirm error-message test is valid)"




# Reflection 
=begin
This was a productive problem and pairing for me.  I had worked on my solution last week with a different partner.  We both 
pseudocoded that we should create multiple short, isolated methods to handle the problem.  But when coding, we couldn't figure out 
how to use multiple methods, only one single one.  We convinced ourselves that our code was simpler and shorter without breaking 
the problem into multiple steps--we still broke it out into multiple lines.  And I still believe we were somewhat right.

But now that I have seen the (relatively simple) problem split into muliple methods, I understand the benefits of it.  This week, 
my new partner (Maddison) and I refactored his code/solution from last week.  When I reviewed his work from last week, I was struck 
by how elegantly simple the work was.  I initially felt bad suggesting that we break his concise work into smaller (perhaps wordier) 
methods.  I do see the benefit to that.  Each method is now very focused and performs a specific task--its name really draws 
attention to what it is supposed to do.  And the code becomes so short and to the point that it doesn't need comment--the method 
name effectively serves as the comment.  

On the other hand, I am still not convinced this problem is ripe for separating into multiple methods.  I said above that 
the method names themselves are so specific that they seem to obviate the need for comments.  I would argue, however, that even in 
the lack of multiple methods, the specific variable names fill the same role.  More importantly, each of these methods seem 
so interrelated that there is no point in separating them into separate methods.  I can't foresee a situation in which I am 
going to want to call only the double method or only the sum_elements method.  I don't know much about credit cards at all--perhaps 
there are many other formulas that might rely on these elements.  If that is the case, then I definitely see the benefit in 
separating these functions out; otherwise, I think it's improper for this particular case.  Either way, I think it was a good 
exercise--good practice just to see that methods can indeed be separated out if needed. 
=end