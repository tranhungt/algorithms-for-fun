#you go in a store with a knapsack of limited capacity.
#you want the most value for your carrying capacity
@iterations = 0
def get_max_value(capacity, items, optimal_carrying = [])
  possible_takes = items.select{|item| item[:weight] <= capacity}
  possible_takes.map do |item|
    @iterations += 1
    item[:value] + get_max_value(capacity - item[:weight], items)
  end.max || 0
end


items = [
          {weight: 6, value: 30}, {weight:3, value: 14}, 
          {weight: 4, value: 19}, {weight: 2, value: 9}
        ]
input_capacity = ARGV[0].to_i
capacity = input_capacity > 0 ? input_capacity : 10
p get_max_value(capacity, items)