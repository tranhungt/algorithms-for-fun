# Given a 7 digit telephone number, print out all the possible 
# sequences of letters that can represent the given telephone number. 
# Note that in a standard 12 key pad, 0 and 1 do not have any letters 
# associated with them. They are to be treated as such, i.e. a 0/1 in 
# the telephone number will be retained in the final word as well. 
# You may use the following mapping between numbers and characters:

# 0 => 0
# 1 => 1
# 2 => abc
# 3 => def
# 4 => ghi
# 5 => jkl
# 6 => mno
# 7 => pqrs
# 8 => tuv
# 9 => wxyz
# INPUT SAMPLE:

# Your program should accept as its first argument a path to a filename.The input file contains 7 digit telephone numbers, one per line.

# 4155230
# OUTPUT SAMPLE:

# Print out the words that can produce the telephone number, 
# alphabetically sorted and comma delimited. eg.


@telephone = {
0 => '0',
1 => '1',
2 => 'abc',
3 => 'def',
4 => 'ghi',
5 => 'jkl',
6 => 'mno',
7 => 'pqrs',
8 => 'tuv',
9 => 'wxyz'
}

def telephone_words(numString)
  numbers = numString.split('').map{|num| num.to_i}
  puts get_word(numbers,0).join(',')

end

def get_word(numbers,index)
  if index == numbers.length() - 1
    letters = @telephone[numbers[index]].split('')
    return letters 
  end 
  words = []
    number = numbers[index]
    @telephone[number].each_char do |letter|
        get_word(numbers,index+1).each do |word|
          words.push(letter + word)
        end
    end
  return words

end

File.open(ARGV[0]).each do |line|
  telephone_words(line.strip)
end