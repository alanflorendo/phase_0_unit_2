# U2.W5: Class Warfare, Validate a Credit Card Number


# I (Alan Florendo) worked on this challenge Farheem Malik.

# 2. Pseudocode

# Input:
# Credit Card with Number

# Output:
# Whether the card number is valid or invalid

# Steps:
# Create a class CreditCard 
  # Initialize card with 16-digit card number
  # Raise error if card is not 16 digits
  
  # Step 1: create double_element method
    # Step 1a: Convert credit card number string to array of characters
    # Step 1b: Double every even numbered element
  # Step 2: create sum_elements method
    # Step 2a:  If any element has two digits, add them together (12 = 1 + 2)
    # Step 2b: Sum all elements together
  # Step 3: Create check_card method. 
    # Return true if sum is a multiple of 10 (%10), otherwise false


# 3. Initial Solution

=begin
# Don't forget to check on intialization for a card length
# of exactly 16 digits
class CreditCard
  def initialize(card_num)
      if card_num.to_s.length == 16
         @card_num = card_num
      else
          raise ArgumentError.new("Card must be 16 digits")
      end
  end
  
  def check_card
      @card_num = @card_num.to_s.split('').map(&:to_i)
      16.times do |index|
          if index % 2 != 0
              @card_num[index] *= 2
          end
      end
      
      card_index = 0
      @card_num.each do |element|
          if element > 9
              dummy = element.to_s.split('').map(&:to_i)
              element = dummy[0] + dummy[1]
              @card_num[card_index] = element

          end
         card_index += 1
      end
      
      digits_sum = 0
      @card_num.each do |element|
          digits_sum += element.to_i
      end
      
      if digits_sum % 10 == 0
          true
      else
          false
      end
      
          
  end
      
end

=end


# 4. Refactored Solution
class CreditCard
  def initialize(card_num)
      @card_num = card_num
      raise ArgumentError.new("Card must be 16 digits") if card_num.to_s.length != 16
  end
  
  def check_card
      @card_num = @card_num.to_s.split('').map(&:to_i)
      16.times do |index|
          @card_num[index] *= 2 if index % 2 != 0
      end
      
      @digits_to_sum = []
      @card_num.each do |element|
          if element > 9
              @digits_to_sum << 1 + (element % 10)
          else
              @digits_to_sum << element
          end
      end
              
      digits_sum = 0
      @digits_to_sum.each do |element|
          digits_sum += element
      end
      
      digits_sum % 10 == 0
   end
end





# 1. DRIVER TESTS GO BELOW THIS LINE
valid_card = CreditCard.new(4408041234567893)
puts valid_card.check_card == true

invalid_card = CreditCard.new(4408041234567892)
puts invalid_card.check_card == false

puts valid_card.method(:initialize).arity == 1

# error_card = CreditCard.new(1234) # => raises ArgumentError



# 5. Reflection 

=begin
We did well to focus first on leveraging techniques we knew we could do in order to solve the problem, 
which we both found complex from the beginning.  We pretty much embraced some sloppy loops and if
statements, as long as we both understood what the blocks were trying to do.  We had several issues
converting numbers to strings and back again, so we used trial and error to figure out where the 
problems were, probably adding several unnecessary "to_i"s and "to_s"s.  We used both a debugger
and internal puts/print statements to figure out where our code was breaking down.

Once we got our code to solve the problem, we used the refactoring as an opportunity to refine our
code and to research other methods we were less familiar with (like mapping).  The result is certainly
a much shorter and hopefully cleaner code.  I think it reads for a more sophisticated audience--I 
do no know that I would necessarily be understand what we wrote if I saw it cold.  But I do think
it is in line with what other coders are doing, and bringing it to this more sophisticated (higher-
level) style will definitely help us get better at reading others' code as well.

=end
