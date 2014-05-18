# U2.W4: Cipher Challenge


# I worked on this challenge with: .



# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.


=begin
def north_korean_cipher(coded_message) 
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs.
  decoded_sentence = []
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
            "g" => "c",   # Use a formula that subtracts four from each input character
            "h" => "d",   # Also consider end case for a,b,c,d as well as non letter characters
            "i" => "e", 
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
            
  input.each do |x| # What is #each doing here? - .each is iterating over each element (character) in the array
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true? - Used to check if character doesn't match integer, symbol, or letter, needs to be set to false as default - if set to true characeters like paranthesis would not match categories below and not be added to decoded_sentence (line 62 & 63 wouldn't execute)
    cipher.each_key do |y| # What is #each_key doing here? - Iterates through hash based on keys
      if x == y  # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really?
        puts "I am comparing x and y. X is #{x} and Y is #{y}."
        decoded_sentence << cipher[y] #This adds cipher[y] to the next available position in array decoded_sentence
        found_match = true
        break  # Why is it breaking here? - because we don't need to check the other categories (symbols, numbers)
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing? - Checking for symbols
        decoded_sentence << " " #if symbol => add space to decoded_sentence
        found_match = true
        break
      elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do? - Creates an array of digits and tests to see if x is a digit between 0 and 9
        decoded_sentence << x
        found_match = true
        break
      end 
    end
    if not found_match  # What is this looking for? - If x isn't a number, letter, or identified symbol
      decoded_sentence << x # Add the original x to decoded_sentence
    end
  end
  decoded_sentence = decoded_sentence.join("") # Concatenates the array into one long string
 
  if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help. - Searching for any digit that occurs one or more times
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate... - Divides number by 100
  end  
  return decoded_sentence # What is this returning? - Final decoded_sentence string      
end
=end

# Your Refactored Solution
def north_korean_cipher(coded_message) 
  input = coded_message.downcase.split("") 
  decoded_sentence = []
  input.each do |x| 
    if (97..100).to_a.include?(x.ord)
      decoded_char = (119 + (x.ord - 97)).chr
    elsif (101..122).to_a.include?(x.ord)
      decoded_char = (x.ord - 4).chr 
    elsif (["@","#","$","%","^","&","*"]).include?(x) 
      decoded_char = " "
    else
      decoded_char = x
    end 
    decoded_sentence << decoded_char
  end
  decoded_sentence = decoded_sentence.join("") 
  if decoded_sentence.match(/\d+/) 
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } 
  end  
  return decoded_sentence 
end





# Driver Code:
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.") == "our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!") == "our nukes are held together by grape-flavored toffee. don't tell the us!"
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.") == "if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!") == "next stop: south korea, then japan, then the world!"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?") == "can somebody just get me 100 bags of cool ranch doritos?"

# Reflection
=begin

We did well by focusing on the driver code and using that to interpret what our code needed to accomplish.  
We also did kept a decent amount of the intial code, trying not to rewrite everything, but instead trying to 
find what was useable (and well-written) in the initial code.  As a pair, we were very good at explaining to each
other the various code blocks we did not initially understand.  We also paid a lot of attention while the other 
was typing, catching syntax errors and focusing on what could be accomplished more simply.  In the end, 
we were pleasantly surprised to find that our code worked the first time.

=end