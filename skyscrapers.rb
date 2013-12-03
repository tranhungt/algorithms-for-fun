#Not done - wrong output params
def import_data(file)
  data_triplets = []
  File.open(file).each_line do |line|
    data_triplets << line.chomp.split(';')
  end
  data_triplets
end

def parse_triplets(data_triplets)
  data_triplets.map do |data_triplet|
    data_triplet.map do |triplet|
      parse_to_numbers(triplet.strip)
    end
  end
end

def parse_to_numbers(triplet)
  triplet = triplet[1...-1].split(',').map(&:to_i)
end

def make_skyscraper(file)
  outlines = []
  data_triplets = import_data(file)
  triplet_lines = parse_triplets(data_triplets)
  triplet_lines.each do |triplet_line|
    p triplet_line
    outlines << make_outline(triplet_line)
  end
  outlines.each{|outline| p outline}
end

def make_outline(triplet_line, outline = [])
  return outline if triplet_line.length == 0
    triplet = triplet_line.shift
    start = triplet[0]
    finish = triplet[2]
    height = triplet[1]
    start.upto(finish).each do |k|
      outline[k] = height
    end
    make_outline(triplet_line, outline)
end

make_skyscraper(ARGV[0])