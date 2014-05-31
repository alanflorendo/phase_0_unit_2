#print "What's your credit number? "
#credit = gets.chomp

class CreditCard
  def initialize(credit)
    if (!(credit.include?(" "))) 
      @credit = credit
    else
      @credit = credit.delete(" ")
    end
    raise ArgumentError.new("Invalid Card Length") if @credit.length != 16
  end
    
  def double
       @double = @credit.split("").map.with_index { |n,i| i%2==0 ? n.to_i * 2 : n.to_i }
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


# myvisa = CreditCard.new(credit)
# p myvisa.double
# puts myvisa.sum_elements
# puts myvisa.check_card

# user enters card #: 4539249060596470 
# validcard = CreditCard.new(credit)
# puts validcard.checkcard

# # user enters card #: 378282246310005
# fakecard = CreditCard.new(credit)
# puts falsecard.checkcard

def assert 
  raise "Assertion failed!" unless yield
end

validcard = CreditCard.new("4539249060596470")
assert {validcard.check_card} 

invalidcard = CreditCard.new("378282246310005")
assert {invalidcard.check_card==false}

spacedcard = CreditCard.new("4539 24 906059 64 7 0")
assert {validcard.check_card} 

not16digits = CreditCard.new("83242234290")
assert {not16digits.check_card==false}







