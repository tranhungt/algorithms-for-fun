# You are given two strings 'A' and 'B'. 
# Print out a 1 if string 'B' occurs at the end of string 'A'. 
# Else a zero.

# INPUT SAMPLE:

# The first argument will be the path to the input filename 
# containing two strings, comma delimited, one per line. 
# Ignore all empty lines in the input file. E.g.

# Hello World,World
# Hello CodeEval,CodeEval
# San Francisco,San Jose
# OUTPUT SAMPLE:

# Print out 1 if the second string occurs at the end of the first string. 
# Else zero. Do NOT print out empty lines between your output. E.g.

# 1
# 1
# 0

def trailing_string(words)
  first_word, second_word = words
  if first_word[-(second_word.length), first_word.length] == second_word
    puts '1'
  else
    puts '0'
  end
end

File.open(ARGV[0]).each do |line|
  trailing_string(line.strip.split(','))
end