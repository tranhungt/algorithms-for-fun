def get_max_apples(board)
  puts "initial board"
  display_board(board)
  board.each_with_index do |row, y|
    row.each_with_index do |val, x|
      if y == 0 && x == 0
        #blah
      elsif y == 0
        board[y][x] += board[y][x-1]
      elsif x == 0
        board[y][x] += board[y-1][x]
      else
        board[y][x] += [board[y-1][x], board[y][x-1]].max.to_i
      end
    end
  end
  puts "accumulated board"
  display_board(board)
  puts "max apples is #{board.last.last}"
end

def display_board(board)
  board.each do |row|
    p row
  end
end

board = [[1,2,3],[0,5,3],[5,3,1]]
get_max_apples(board)