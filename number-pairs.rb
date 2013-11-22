# Challenge Description:

# You are given a sorted array of positive integers and a number 'X'. Print out all pairs of numbers whose sum is equal to X. Print out only unique pairs and the pairs should be in ascending order

# Input sample:

# Your program should accept as its first argument a filename. This file will contain a comma separated list of sorted numbers and then the sum 'X', separated by semicolon. Ignore all empty lines. If no pair exists, print the string NULL e.g.

# 1,2,3,4,6;5
# 2,4,5,6,9,11,15;20
# 1,2,3,4;50
# Output sample:

# Print out the pairs of numbers that equal to the sum X. The pairs should themselves be printed in sorted order i.e the first number of each pair should be in ascending order. E.g.

# 1,4;2,3
# 5,15;9,11
# NULL

def make_hash(numbers)
  hash = {}
  numbers.each do |num|
    hash[num] = true
  end
  hash
end

def find_pairs(numbers, hash, sum)
  pairs = []
  numbers.each do |num|
    needed_num = sum - num
    if hash[needed_num] && num != needed_num
      pairs << [num, needed_num].sort
      hash[num] = nil
      hash[needed_num] = nil
    end
  end
  pairs
end

def print_pairs(pairs)
  if pairs.empty?
    puts "NULL"
  else
    puts pairs.map{|pair| pair.join(',')}.join(';')
  end
end

def start
  File.open(ARGV[0]).each do |line|
    input = line.chomp.split(';');
    numbers = input[0].split(',').map(&:to_i)
    sum = input[1].to_i
    hash = make_hash(numbers)
    pairs = find_pairs(numbers, hash, sum)
    print_pairs(pairs)
  end
end

start