#You're in an ancient tomb of valuable manuscripts, 
#The tomb is slowly collapsing
#You have a limited size knapsack, 
#and must maximize the value of what to bring with you before the tomb collapses

def get_max_value_items(capacity, items)
  capacity = capacity + 1
  matrix = Array.new(capacity){Array.new(items.length){0}}
  capacity.times do |c|
    items.each_with_index do |item, k|
      weight = item[:weight]
      value = item[:value]
      if weight < c
        value + get_row_value(matrix[c - weight])
        matrix[c][k] = 1
      end
    end
  end

  matrix.each do |row|
    row << get_row_value(row, items)
    p row
  end
end

def get_row_value(row, items)
  value_sum = 0
  row.each_with_index do |val, k|
    value_sum += val * items[k][:value]
  end
end

items = [
          {weight: 6, value: 30}, {weight:3, value: 14}, 
          {weight: 4, value: 19}, {weight: 2, value: 9}
        ]
input_capacity = ARGV[0].to_i
capacity = input_capacity > 0 ? input_capacity : 10
get_max_value_items(input_capacity, items)