def number_of_ones(num)
  binary = getBinary(num)
  puts binary.count('1')
end

def getBinary(num)
  binary = ''
  until num == 0
    mod = num % 2
    num /= 2
    binary = mod.to_s + binary
  end
  binary
end

File.open(ARGV[0]).each do |line|
  number_of_ones(line.to_i)
end