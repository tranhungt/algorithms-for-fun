# Write a program to read a multiple line text file and write the 'N' longest lines to stdout. 
# Where the file to be read is specified on the command line.

# INPUT SAMPLE:

# Your program should read an input file (the first argument to your program). 
# The first line contains the value of the number 'N' followed by multiple lines. 
# You may assume that the input file is formatted correctly and 
# the number on the first line i.e. 'N' is a valid positive integer. E.g.

# 2
# Hello World
# CodeEval
# Quick Fox
# A
# San Francisco
# OUTPUT SAMPLE:

# The 'N' longest lines, newline delimited. 
# Ignore all empty lines in the input. 
# Ensure that there are no trailing empty spaces on each line you print. 
# Also ensure that the lines are printed out in decreasing order of length i.e. 
# the output should be sorted based on their length. E.g.

# San Francisco
# Hello World

def longest_lines(lines, n)
  lines = mergeSort(lines)
  lines[0,n].each do |line|
    puts line
  end
end

def mergeSort(lines)
  return lines if lines.length <= 1
  left = lines[0, lines.length / 2]
  right = lines[lines.length / 2, lines.length]
  merge(mergeSort(left), mergeSort(right))
end

def merge(left, right)
  total = []
  until left.length == 0 || right.length == 0
    if left.first.length > right.first.length
      total << left.shift
    else
      total << right.shift
    end
  end
  total + left + right
end

def run
  lines = []
  n = 0;
  i = 0
  File.open(ARGV[0]).each do |line|
    if i == 0
      n = line.to_i
      i += 1
      next
    end
    i += 1
    lines << line.strip
  end
  longest_lines(lines, n)
end

run