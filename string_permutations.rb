# Write a program to print out all the permutations of a string in alphabetical order.

# INPUT SAMPLE:

# Your program should accept as its first argument a path to a file containing 
# an input string, one per line. E.g.

# hat
# abc
# Zu6
# OUTPUT SAMPLE:

# Print to stdout, permutations of the string, comma separated, 
# in alphabetical order. E.g.

# aht,ath,hat,hta,tah,tha
# abc,acb,bac,bca,cab,cba
# 6Zu,6uZ,Z6u,Zu6,u6Z,uZ6

def string_permutations(word)
  perms = word.split('').permutation.to_a.sort.map{|letters| letters.join('')}.join(',')
  puts perms
end

File.open(ARGV[0]).each do |line|
  string_permutations(line.strip)
end