# Write a program to remove specific characters from a string.

# INPUT SAMPLE:

# The first argument will be a path to a filename containing an 
# input string followed by a comma and then the characters that 
# need to be scrubbed. E.g.

# how are you, abc
# hello world, def
# OUTPUT SAMPLE:

# Print to stdout, the scrubbed strings, one per line. 
# Trim out any leading/trailing whitespaces if they occur. E.g.

# how re you
# hllo worl

def remove_characters(line)
  string = line[0]
  letters = line[1]
  letters.length.times do |i|
    string.gsub!(letters[i], '')
  end
  puts string
end

File.open(ARGV[0]).each do |line|
  remove_characters(line.strip.split(', '))
end