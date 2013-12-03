#Ah.. the N-queens problem. :) Fun. :)
#Run this ruby script directly. On the bottom, you can change the 'n' parameter
# Will need to 'gem install colorize' for pretty colors
require 'colorize'
require 'set'
def queens(size)
  @board = create_board(size)
  @size = size
  count = @size
  display_board(@board)
  puts ''
  @final_boards = Set.new
  @size.times do |y|
    p count
    test_board = create_board(@size)
    test_board[y][0] = 'X'
    y_arr = [y]
    x_arr = [0]
    x = 0
    place_queens(test_board,count - 1,y_arr, x_arr, x+1)
  end
  
  p "#{@final_boards.count} distinct boards"
end

def place_queens(board, count, y_arr, x_arr, x)
  if count == 0
    puts ''
    @final_boards << board 
    display_board(board)
    puts ''
    return
  end

  traversal_excludes(y_arr).each do |y|
    if diag_matches?(y, x, y_arr, x_arr) == false
      test_board = Marshal.load(Marshal.dump(board))
      test_board[y][x] = 'X'
      new_x_arr = (x_arr.dup << x)
      new_y_arr = (y_arr.dup << y)

      place_queens(test_board,count - 1,new_y_arr, new_x_arr, x + 1)
    end   
  end
end

def diag_matches?(y, x, y_arr, x_arr)
  diag_matches = false
  y_arr.each_index do |i|
    diag_matches = true if (y_arr[i] - y).abs == (x_arr[i] - x).abs
  end
  diag_matches
end

def traversal_excludes(arr)
  (0...@size).to_a.select{|el| !arr.include?(el)}
end

def display_board(board)
  size = board.size
  size.times do |y|
    size.times do |x|
      print (board[y][x].to_s + " ").colorize(:background => :brown) if (y+x).even?
      print (board[y][x].to_s + " ").colorize(:background => :light_red) if (y+x).odd?
    end
    print "\n"
  end
end

def create_board(size)
  Array.new(size){Array.new(size){' '}}
end

queens(10)