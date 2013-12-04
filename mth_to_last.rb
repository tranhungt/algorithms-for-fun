# Write a program to determine the Mth to last element of a list. 
# INPUT SAMPLE:

# The first argument will be a text file containing a series of space 
# delimited characters followed by an integer representing a index 
# into the list (1 based), one per line. E.g. 
# a b c d 4
# e f g h 2
# OUTPUT SAMPLE:

# Print to stdout, the Mth element from the end of the list, 
# one per line. If the index is larger than the list size, 
# ignore that input. E.g.

# a
# g


def get_letter(arr)
  index = (arr[-1].to_i + 1) * -1
  puts (arr[index])
end

File.open(ARGV[0]).each do |line|
  get_letter(line.split(' '))
end