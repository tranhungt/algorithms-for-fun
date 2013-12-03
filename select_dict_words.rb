
write_file = File.open('word_list.txt', 'w')
write = true;
File.open('norm_and_reverse.txt').each do |line|
  if write == true
    write_file.write(line)
  end
  write = !write
end