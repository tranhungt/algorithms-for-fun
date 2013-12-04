# Write a program to determine the number of 1 bits in the internal 
# representation of a given integer.

# INPUT SAMPLE:

# The first argument will be a text file containing an integer,
 # one per line. E.g.

# 10
# 22
# 56
# OUTPUT SAMPLE:

# Print to stdout, the number of ones in the binary form of each number. E.g.

# 2
# 3
# 3


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