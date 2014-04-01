#get number of possible moves from 0,0 to n,n
#currently restricts robot to right and down moves only
#next step - allows up,down,left,right movements with no revisits

def get_num_movements(n)
  matrix = Array.new(n){Array.new(n){0}}
  matrix.each_with_index do |row, y|
    row.each_with_index do |val, x|
      if y == 0 || x == 0
        matrix[y][x] = 1
      else
        matrix[y][x] += matrix[y][x-1] + matrix[y-1][x]
      end
    end
  end
  puts matrix.last.last
end

get_num_movements(4)