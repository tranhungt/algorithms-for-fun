# Challenge Description:

# The sentence 'A quick brown fox jumps over the lazy dog' contains every single letter in the alphabet. Such sentences are called pangrams. You are to write a program, which takes a sentence, and returns all the letters it is missing (which prevent it from being a pangram). You should ignore the case of the letters in sentence, and your return should be all lower case letters, in alphabetical order. You should also ignore all non US-ASCII characters.In case the input sentence is already a pangram, print out the string NULL

# Input sample:

# Your program should accept as its first argument a filename. This file will contain several text strings, one per line. Ignore all empty lines. eg.

# A quick brown fox jumps over the lazy dog
# A slow yellow fox crawls under the proactive dog
# Output sample:

# Print out all the letters each string is missing in lowercase, alphabetical order .e.g.

# NULL
# bjkmqz

def get_alphabet_hash
  alphabet = {}
  ('a'..'z').each do |c|
    alphabet[c] = true
  end
  alphabet
end

def remove_letters_from_alphabet(alphabet, word)
  word.each_char do |c|
    alphabet[c] = false
  end
end

def traverse_words(alphabet, string_input)
  string_input.split(' ').each do |word|
    remove_letters_from_alphabet(alphabet, word.downcase)
  end
end

def print_result(alphabet)
  result = ""
  alphabet.each do |k,v|
    result += k if v == true
  end
  puts result.length > 0 ? result : "NULL"
end

def start
  string_input = ""
  File.open(ARGV[0]).each do |line|
    string_input = line.chomp
    alphabet = get_alphabet_hash
    traverse_words(alphabet, string_input)
    print_result(alphabet)
  end

end

start