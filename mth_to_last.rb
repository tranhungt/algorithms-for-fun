def get_letter(arr)
  index = (arr[-1].to_i + 1) * -1
  puts (arr[index])
end

File.open(ARGV[0]).each do |line|
  get_letter(line.split(' '))
end