# U2.W6: Testing Assert Statements

# I worked on this challenge by myself.


# 2. Review the simple assert statement

def assert
	if yield
		puts "True"
	else
		raise "Assertion failed!"
	end
#  raise "Assertion failed!" unless yield
end

=begin

def assert
  raise "Assertion failed!" unless yield
end

name = "bettysue"
assert { name == "bettysue" }
assert { name == "billybob" }
=end

# 2. Pseudocode what happens when the code above runs
# Create assert method (no argument)
	# if code block called by assert method returns true, take no action
	# if code block called by assert method returns false, raise error message


# 3. Copy your selected challenge here
class Boggle_Board
    def initialize(board)    
        if board.empty?     
            raise ArgumentError.new("Board cannot be empty")
        else
            @board = board
        end
    end

  def create_word(*coords)
    coords.map { |coord| @board[coord.first][coord.last]}.join("")
  end
  
  def get_row(row)
    @board[row-1]
  end


  def get_col(col)
    col_array = []
    num_cols = @board.length # #cols equals #row_arrays in the board array
    num_cols.times do |looping_row| 
      col_array << @board[looping_row][col-1]
    end
    return col_array
  end
end
  
# ORIGINAL DRIVER CODE

boggle_board2 = Boggle_Board.new(  [["b", "r", "a", "e"],
                                    ["i", "o", "d", "t"],
                                    ["e", "c", "l", "r"],
                                    ["t", "a", "k", "e"]] )

#p boggle_board2.create_word([2,1],[1,1],[1,2],[0,3]) == "code"  #=> returns "code"  
#p boggle_board2.create_word([0,1],[0,2],[1,2]) == "rad"  #=> creates what california slang word? => "rad"




# 4. Convert your driver test code from that challenge into Assert Statements

assert { boggle_board2.create_word([2,1],[1,1],[1,2],[0,3]) == "code"}  #=> returns "code"  
assert { boggle_board2.create_word([0,1],[0,2],[1,2]) == "rad"}  #=> returns "rad"




# 5. Reflection
=begin
I appreciate the simplicity of the assertion function.  It makes the driver code much more readable, less 
clumsy.  

I ended up revising my assert method so that it printed a "True" statement at the command line for each test 
that ran successfully.  I prefer this explicit validation rather than just the implicit lack of receiving an 
error message.  In the future, I might also have the "assert" method print false for failed tests rathe than 
simply raising an argument error.  Given that we're getting "True" for successful tests, it seems consistent 
that we would get "False" for inconsistent ones.  Additionally, under the current method, if a test is false, 
you only find out that that test is false and then the error message is raised.  You don't get any indication 
on the outcome of successive tests, true or false.
=end