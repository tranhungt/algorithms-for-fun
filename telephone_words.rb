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