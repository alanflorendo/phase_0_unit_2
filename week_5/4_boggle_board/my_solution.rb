# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge with Hilary Barr.

boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# PSEUDOCODE:  MASTER
=begin
Pseudocode:
Create class Boggle_Board.
    Create initialize method with user-defined board as argument.
        Raise error if board is empty.
    Create create_word method with *coords as splat argument.
        Use .join method to concatenate letters at given coordinates.
        Return word as a string made up of those letters.
    Create get_row method with a row number argument.
        Return row array based on user input of row number.
    Create get_col method with a column number argument.
        Loop through each row.
        Return an array of letter values in given column position.
=end

# CLASS: MASTER
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
  

boggle_board2 = Boggle_Board.new(  [["b", "r", "a", "e"],
                                    ["i", "o", "d", "t"],
                                    ["e", "c", "l", "r"],
                                    ["t", "a", "k", "e"]] )


# Part 1: Access multiple elements of a nested array

# Pseudocode
=begin
Pseudocode:
Create initialize method with user-defined board as argument.
    Raise error if board is empty.
=end

# Initial Solution
=begin
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

=end

# Refactored Solution
=begin
We chose not to refactor.  Here, the bulk of code was given to us and we found it simple, clean,
and effective.  We added one error response to our initial solution, and we felt like that 
was also simple, clean, and effective.
=end

# DRIVER TESTS GO BELOW THIS LINE
  p boggle_board2.create_word([2,1],[1,1],[1,2],[0,3]) == "code"  #=> returns "code"  
  p boggle_board2.create_word([0,1],[0,2],[1,2]) == "rad"  #=> creates what california slang word? => "rad"
  # p boggle_board3=Boggle_Board.new([]) # Should return argument error


# Reflection 
=begin
I was initially confused by the need to define the boggle_board as a class.  I understood that it was the 
main focus of this week's curriculum, so I agreed with my partner that it had to be done.  But it wasn't
until after we first coded "boggle_board2 = Boggle_Board.new" that I realized the usefulness of this decision.  
Given the ease of defining these methods in terms of the class object, we could (if needed) create new boards
for more effective driver testing.  Moreover, I even pointed out during the process that we might want to
build a function that would produce random letters on a board.  Clearly, having the board defined as a class
would be helpful there.

Other than the general question of using a class to represent the boggle_board, we really didn't have any problems
with the initialization method.  It was a simple and clean example, which had just one parameter, effectively
showing us how to declare an instance variable in the class.  We also saw this as a good opportunity to practice
the "raise ArgumentError" technique.
=end

#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode
=begin
Pseudocode:
Create create_word method with *coords as splat argument.
    Use .join method to concatenate letters at given coordinates.
    Return word as a string made up of those letters.
=end

# Initial Solution
=begin
  def get_row(row)
    @board[row-1]
  end
=end

# Refactored Solution
=begin
We chose not to refactor.  Reviewing our code results, we found our code, as written, simple, clean,
and effective.
=end


# DRIVER TESTS GO BELOW THIS LINE
  p boggle_board2.get_row(3) ==  ["e", "c", "l", "r"]
  p boggle_board2.get_row(1) ==  ["b", "r", "a", "e"]


# Reflection 
=begin
Building the get_row method, we learned how well-modeled certain parts of the boggle_board were for certain
functions.  We considered using a loop to implement the method (the way we would need to do for the get_col
method below), but in the end, we learned to first assume that if your data is well-structured, there may
be a very simple way to approach a problem.
=end



<<<<<<< HEAD
#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode
=begin
Pseudocode:
Create get_col method with a column number argument.
    Loop through each row.
    Return an array of letter values in given column position.
=end

# Initial Solution
=begin
  def get_col(col)
    col_array=[]
    for i in 0...@board.length do
        col_array << @board[i][col-1]
    end
    col_array
  end

=end


# Refactored Solution
=begin
  def get_col(col)
    col_array = []
    num_cols = @board.length # #cols equals #row_arrays in the board array
    num_cols.times do |looping_row| 
      col_array << @board[looping_row][col-1]
    end
    return col_array
  end
=end

# DRIVER TESTS GO BELOW THIS LINE
  p boggle_board2.get_col(1) ==  ["b", "i", "e", "t"]
  p boggle_board2.get_col(4) ==  ["e", "t", "r", "e"]


# Reflection 
=begin
We quickly recognized that the get_col method could not be implemented as easily as the get_row method, since 
the board array is an array of row arrays and not of column_arrays.  But we also tried to stick with the same
principles as the get_row method.  What type of value is returned?  (an array)  How is that array retrieved?  
(by looping, either with the array index or using an actual loop)

This was also the only piece of our code that we/I chose to refactor.  I initially implemented the "for loop"
in the code but noted that it was probably not something common for Ruby.  Hilary took the question to a tutor,
who agreed.  Instead, I used a .times loop.  It initially did not seem as readable to me, so I implemented some
longer and more descriptive variable names.  I separately defined a num_cols variable instead of simply using
its definition as the basis for the loop (the .times loop originally read "@board.length.times do |index|...", but
I felt that this was difficult to read).  Thus, we've learned that there is sometimes a tradeoff between brevity 
and readability.

I don't think any of the sections of this challenge were tedious at all because they were already broken down
into such simple methods.  Let this be a lesson to me (and others) to break the project into simpler pieces
even if DBC hasn't done it for me.
=end
=======
>>>>>>> FETCH_HEAD
