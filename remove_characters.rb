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