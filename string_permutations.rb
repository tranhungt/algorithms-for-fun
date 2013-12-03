def string_permutations(word)
  perms = word.split('').permutation.to_a.sort.map{|letters| letters.join('')}.join(',')
  puts perms
end

File.open(ARGV[0]).each do |line|
  string_permutations(line.strip)
end