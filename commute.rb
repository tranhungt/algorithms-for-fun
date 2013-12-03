# 1
# 3
# 2
# 5
# 6
# 4

def distance(coord1, coord2)
  x1,y1 = coord1
  x2,y2 = coord2
  Math.sqrt((x1 - x2)**2 + (y1 - y2)**2)
end
coords = []
File.open(ARGV[0]).each_with_index do |line, i|
  coord = line.split(',').map{|num| num.to_f}
  coord.push(i+1)
  coords.push(coord)
end

def getSequence(coords)
  table = {}
  sequence = [coords[0]]
  coords.delete(coords[0]) 
  table{1: 0}
  
end



getSequence(coords)