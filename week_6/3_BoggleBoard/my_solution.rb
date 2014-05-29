# U2.W6: Create a BoggleBoard Class


# I worked on this challenge by myself.


# 2. Pseudocode



# 3. Initial Solution
=begin
class BoggleBoard
 
  #your code here
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
    @board[row]
  end


  def get_col(col)
    col_array = []
    num_cols = @board.length # #cols equals #row_arrays in the board array
    num_cols.times do |looping_row| 
      col_array << @board[looping_row][col]
    end
    return col_array
  end
 
end
 
 
dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)
 
=end

# 4. Refactored Solution

class BoggleBoard
 
  #your code here
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
    @board[row]
  end


  def get_col(col)
    col_array = []
    num_cols = @board.length # #cols equals #row_arrays in the board array
    num_cols.times do |looping_row| 
      col_array << @board[looping_row][col]
    end
    return col_array
  end

  def get_diagonal(first, last)
  	row = first[0]
  	col = first[1]
  	last_row = last[0]
  	last_col = last[1]
  	diag_word = []

  	# Create slope variable for row and column
  	# 1 or -1 (get slope to only 1 or -1 by dividing the signed difference by the abs/val difference)
  	row_slope = (last_row - row)/((last_row - row).abs)
  	col_slope = (last_col - col)/((last_col - col).abs)


  	until row == last_row
  		diag_word << @board[row][col]
  		row = row + row_slope
  		col = col + col_slope
  	end

  end
 
end



# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:

def assert(test,false_msg="False")
	if test
		puts "True"
	else
		puts false_msg
	end
end

# test 1:  spell out dock using create_word
assert(boggle_board.create_word([1,2], [1,1], [2,1], [3,2]) == "dock", "Error:  coordinates should spell out 'dock'")

# test 2: get_row tests
assert(boggle_board.get_row(0)==["b","r","a","e"], "Error: row should spell out 'brae'")
assert(boggle_board.get_row(1)==["i","o","d","t"], "Error: row should spell out 'iodt'")
assert(boggle_board.get_row(2)==["e","c","l","r"], "Error: row should spell out 'eclr'")
assert(boggle_board.get_row(3)==["t","a","k","e"], "Error: row should spell out 'take'")

# test 3: get_col tests
assert(boggle_board.get_col(0)==["b","i","e","t"], "Error: row should spell out 'biet'")
assert(boggle_board.get_col(1)==["r","o","c","a"], "Error: row should spell out 'roca'")
assert(boggle_board.get_col(2)==["a","d","l","k"], "Error: row should spell out 'adlk'")
assert(boggle_board.get_col(3)==["e","t","r","e"], "Error: row should spell out 'etre'")


# 5. Reflection 