#Ah.. the N-queens problem. :) Fun. :)
# Finds all the board configurations of nxn chess board with n-queens.
#No queens can attack each other, that is, they will never be on the same 
# horizontal, vertical, or diagonal.

#Run this ruby script directly. On the bottom, you can change the 'n' parameter
# Will need to 'gem install colorize' for pretty colors

require 'colorize'
require 'set'

class NQueens
  def initialize(size)
    @size = size
    @final_boards = Set.new
  end

  def make_queens_boards
    queens_needed = @size
    x = 0
    @size.times do |y|
      test_board = create_board(@size)
      test_board[y][x] = 'X'
      y_arr = [y]
      x_arr = [x]
      place_queens(test_board, queens_needed - 1, y_arr, x_arr, x + 1)
    end
  end

  def display_final_boards
    @final_boards.each{|board| display_board(board)}
    p "#{@final_boards.count} configurations in a #{@size}x#{@size} board"
  end

  def place_queens(board, queens_needed, y_arr, x_arr, x)
    if queens_needed == 0
      @final_boards << board 
    else
      traversal_excludes(y_arr).each do |y|
        unless diag_matches?(y, x, y_arr, x_arr)
          test_board = dup_board(board)
          test_board[y][x] = 'X'
          new_x_arr = (x_arr.dup << x)
          new_y_arr = (y_arr.dup << y)
          place_queens(test_board, queens_needed - 1,new_y_arr, new_x_arr, x + 1)
        end   
      end
    end
  end

  def dup_board(board)
    Marshal.load(Marshal.dump(board))
  end

  def diag_matches?(y, x, y_arr, x_arr)
    y_arr.each_index do |i|
      return true if (y_arr[i] - y).abs == (x_arr[i] - x).abs
    end
    false
  end

  def traversal_excludes(positions)
    (0...@size).to_a.select{|el| !positions.include?(el)}
  end

  def display_board(board)
    @size.times do |y|
      @size.times do |x|
        print (board[y][x].to_s + " ").colorize(:background => :green) if (y+x).even?
        print (board[y][x].to_s + " ").colorize(:background => :light_red) if (y+x).odd?
      end
      print "\n"
    end
    print "\n"
  end

  def create_board(size)
    Array.new(size){Array.new(size){' '}}
  end
end

n = 8
nqueens = NQueens.new(n)
time = Time.now
nqueens.make_queens_boards
nqueens.display_final_boards
puts "Computation took #{Time.now - time}s"