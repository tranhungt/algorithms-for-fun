# Challenge Description:

# Given a decimal (base 10) number, print out its binary representation.

# Input sample:

# File containing positive whole decimal numbers, one per line. 
# Ignore all empty lines. e.g.

# 2
# 10
# 67
# Output sample:

# Print the binary representation, one per line. e.g.

# 10
# 1010
# 1000011

def convert_to_binary(decimal)
  binary = ""
  while decimal > 0
    binary = (decimal % 2).to_s + binary
    decimal = decimal / 2
  end
  binary
end

def start
  File.open(ARGV[0]).each do |line|
    decimal = line.chomp.to_i
    puts convert_to_binary(decimal)
  end
end

start