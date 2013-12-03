file = File.read('word_list.txt')
word_list = file.split("\n")
magoosh = 'magoosh'
word_list.select! do |word|
  take = true
  magoosh.length.times do |i|
    if word.count(magoosh[i]) < magoosh.count(magoosh[i])
      take = false
    end
  end
  take
end
p word_list.select{|word| word.length< 10}.map{|word| "#{word} #{word.length}"}