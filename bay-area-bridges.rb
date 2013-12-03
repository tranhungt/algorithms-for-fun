#Not Done
def get_bridge_data(file)
  bridges = Hash.new { |hash, key| hash[key] = [] }
  File.open(file).each_line do |line|
    data = line.chomp.split(': ')
    data[1] = data[1][2...-2].split('], [')
    data[1].each do |pos|
      pos = pos.split(',').map{|p| p.to_f}
      bridges[data[0]] << pos
    end
  end
  bridges
end

def intersect?(bridge1, bridge2)
  
end



def start
  bridges = get_bridge_data(ARGV[0])
  p bridges

end

start