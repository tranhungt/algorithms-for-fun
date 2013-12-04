# A sequence of n > 0 integers is called a jolly jumper if 
# the absolute values of the differences between successive 
# elements take on all possible values 1 through n - 1. eg. 
# 1 4 2 3 
# is a jolly jumper, because the absolute differences are 3, 2, and 1, respectively. 
# The definition implies that any sequence of a single integer is a jolly jumper. 
# Write a program to determine whether each of a number of sequences is a jolly jumper. 
# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename. 
# Each line in this file is one test case. Each test case will contain an 
# integer n < 3000 followed by n integers representing the sequence.
# The integers are space delimited.

# OUTPUT SAMPLE:

# For each line of input generate a line of output saying 'Jolly' or 'Not jolly'.

require 'set'
def jollyJumper(numbers)
  if (numbers.length == 1)
    puts 'Jolly'
    return
  end
  set = (1...numbers.length).to_set

  0.upto(numbers.length() -2) do |i|
    diff = (numbers[i] - numbers[i+1]).abs
    if !set.include?(diff)
      puts 'Not jolly'
      return
    end
    set.delete(diff)
  end
    puts 'Jolly'
end
num = 0
File.open(ARGV[0]).each do |line|
  if num == 0
    puts 'Jolly'
    num += 1
  else
    jollyJumper(line.split(' ').map{|num| num.to_i})
  end
end