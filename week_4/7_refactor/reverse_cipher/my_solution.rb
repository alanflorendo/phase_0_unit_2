# U2.W4: Refactor Cipher Solution


# I worked on this challenge by myself.


# 1. Solution
# Write your comments on what each thing is doing.
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

def translate_to_cipher(sentence)
    alphabet = ('a'..'z').to_a  # Creates a single array (.to_a) of all lowercase letters ('a'..'z')
    cipher = Hash[alphabet.zip(alphabet.rotate(4))] # Creates an array of arrays for the coded characters: 
    # => [ [a,w], [b,x], [c,y], [d,z], [e,a]...[z,v]]
    spaces = ["@", "#", "$", "%", "^", "&", "*"]  # Creates an array of many characters that can replace spaces in the coded text
    
    original_sentence = sentence.downcase # makes entire sentence lowercase for coding purposes (since there is no encryption for uppercase)
    encoded_sentence = []  # creates an empty array into which the coded characters can be placed
    original_sentence.each_char do |element|  # loops through each character (.each_char) of the unencrypted original_sentence
      if cipher.include?(element)  # With each character (from loop), if it's letter character
        encoded_sentence << cipher[element]           # then, replace it with the cipher_array character (offset by 4)
      elsif element == ' '        # With each character (from loop), if it's a space
        encoded_sentence << spaces.sample             # then, choose a random character (.sample) from the encrypted spaces array
      else 
        encoded_sentence << element  # Default => if the character is not a letter or a space, then simply add the character to the array (without encrypting)
      end
     end
    
    return encoded_sentence.join
end


# Questions:
# 1. What is the .to_a method doing?
# The .to_a method converts the alphabet object to an array of the elements in the alphabet

# 2. How does the rotate method work? What does it work on?
# The rotate method offsets the array by 4 characters. The method works only on arrays.

# 3. What is `each_char` doing?
# The .each_char method parses the string object it is called on into a series of its component characters.

# 4. What does `sample` do?
# Here the .sample method is an array method that returns a random element of the array.  The default result
# is for .sample to return a single character.  Adding an optional argument, "spaces.sample(3)" would have 
# returned an array of three randomly chosen characters from the spaces array; this would not make any real 
# sense in this cipher example.

# 5. Are there any other methods you want to understand better?
# I remembered that the "<<" character was a shorthand for adding characters to an existing array, but my
# coding partner (from the original cipher challenge) did not, so I feel like its meaning is worth noting here.
# I also feel like it's worth noting the .zip method which essentially combines two arrays.  In this case, those
# two arrays are (1) the alphabet array and (2) the ciphered alphabet array.  These two arrays are combined into 
# an array of two digit arrays:  [ [a,w], [b,x], [c,y], [d,z], [e,a]...[z,v]].

# 6. Does this code look better or worse than your refactored solution
#    of the original cipher code? What's better? What's worse?
# My original code was shorter and also dealt with the number encryption that was called for in the original project.
# It is noteworthy that this encryption code does not convert numbers the way the original cipher decoding 
# project showed (100 does not become 10000 here.).


# 7. Is this good code? What makes it good? What makes it bad?
#  There is a clean content to this code that I do not think my original paired solution had, (though my solution
# was still readable and also happened to be shorter).  My solution shifted the alphabetic characters by four using
# a mathematical formula based on ASCII characters.  This solution creates an array of arrays (alphabetic character and
# its encoded character counterpart).  Our mathematical formula does not read so intuitively.  In contast, I think
# someone could read the code here, without even understanding that the .zip method creates an array of arrays, and 
# still understand how it is working.


# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time?
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")


# The four encoded values are very similar but not identical.  The letters remain the same each time because
# they are always offset in the alphabet by four.  In contrast, the spaces are replaced by characters chosen
# randomly from the spaces array.  Thus the spaces vary each time the code is run--though repeats are certainly
# possible.


# 5. Reflection 

# I really admire clean writing, both in argumentative essays and in programming.  I am usually hardpressed to 
# refactor my code into something so simple and elegant as the solution here.  I am encouraged that my partner
# and I were able to create an almost as elegant (though still shorter!) version of this code, and that makes
# me think that I working alone could do something similar.   
# I've been reading a few volumes about Ruby.  One of them argues that comments are not necessary in Ruby
# because the code itself is so readable.  I am intrigued by this idea because I happen to think that the 
# code provided above is quite readable without any commenting.  It makes me think that maybe commenting should
# only be used where the code itself is not self-explanatory.  That does not mean that comments shouldn't be used
# to pseudocode ideas originally; hopefully, after refactoring, the comments can be removed.