#A river splits a land mass in half, with cities on the north and south sides
#Each city on the side wants to connect with its sister city on the south side
#However, not every bridge can be built because some would overlap
#Maximize the number of bridges built so that there are no overlaps

def build_bridges(north, south)
  south_map = {}
  south.each_with_index do |val, k|
    south_map[val] = k
  end
  south_index = []
  north.each do |val|
    south_index << south_map[val] + 1
  end
  # p south_index
  chosen_indexes = longest_subsequence(south_index)
  # p chosen_indexes
  puts chosen_indexes.map{|pos| south[pos - 1]}.sort

end


def longest_subsequence(sequence)
  sequence.map!{|num| [num, [num]]}
  sequence.each_with_index do |value, curr_index|
    num, sub = value
    prev_subs = []
    0.upto(curr_index) do |k|
      if sequence[k][0] < num
        prev_subs << sequence[k][1]
      end
    end
    sequence[curr_index][1] = Array(prev_subs.max_by{|el| el.size}) + sequence[curr_index][1]
  end
  sequence.max_by{|el| el[1].size}.last
end

# north1 = [0,1,2,3,4,5] #[0,2,1,3,5,4]
# south2= [0,2,1,3,5,4] 

# north2 = [1,4,5,6,3,2] #[0,1,4,2,3,5,6]
# south2 = [1,5,6,4,3,2] 


def start
  bridges = Hash.new { |hash, key| hash[key] = [] }
  File.open(ARGV[0]).each_line do |line|
    data = line.chomp.split(': ')
    data[1] = data[1][2...-2].split('], [')
    data[1].each do |pos|
      pos = pos.split(',').map{|p| p.to_f}
      bridges[data[0].to_i] << pos
    end
  end
  east_cities = []
  west_cities = []
  bridges.each do |city_number, coords|
    east, west = coords
    east_cities << {city_number => east}
    west_cities << {city_number => west}
  end
  east_cities.sort!{|a, b| b.values.first.first <=> a.values.first.first}.map!{|city| city.keys.first}
  west_cities.sort!{|a, b| b.values.first.first <=> a.values.first.first}.map!{|city| city.keys.first}
  # p east_cities
  # p west_cities
  build_bridges(east_cities, west_cities)
end


start