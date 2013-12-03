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