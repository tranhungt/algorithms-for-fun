# Challenge Description:

# Write a program to determine the largest sum of contiguous integers in a list.

# Input sample:

# The first argument will be a text file containing a comma separated list of integers, one per line. E.g.

# -10, 2, 3, -2, 0, 5, -15
# 2,3,-2,-1,10
# Output sample:

# Print to stdout, the largest sum. In other words, of all the possible contiguous subarrays for a given array, find the one with the largest sum, and print that sum. E.g.

# 8
# 12


def get_max_sum(numbers)
  max_so_far = max_ending_here = 0
  numbers.each do |num|
    if (max_ending_here + num > 0)
      max_ending_here += num
      if (max_ending_here > max_so_far)
        max_so_far = max_ending_here
      end
    else
      max_ending_here = 0
    end
  end
  max_so_far
end

def start
  File.open(ARGV[0]).each do |line|
    numbers = line.chomp.split(',').map(&:to_i)
    puts get_max_sum(numbers)
  end
end

start