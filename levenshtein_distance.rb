require 'set'

class SocialWords
  def initialize(file)
    @dict = get_dictionary(file)
  end

  def get_dictionary(file)
    dict = Set.new
    File.open(file).each do |line|
      dict << line.strip.downcase
    end
    dict
  end

  def get_social_network(word)
    visited = Set.new([word])
    word_list = [word]
    until word_list.empty?
      current_word = word_list.shift
      get_neighbors(current_word,visited, word_list)
    end
    visited
  end

  def get_social_network_count(word)
    get_social_network(word).count
  end

  def get_neighbors(word, visited, word_list)
    alphabet = ('a'..'z').to_a
    0.upto(word.length) do |k|
      alphabet.each do |letter|
        sub = word.clone
        sub[k] = letter
        add = word.clone
        add.insert(k,letter)
        remove = word.clone
        remove[k] = ''
        [sub,add,remove].each do |temp| 
          if @dict.include?(temp) && !visited.include?(temp)
            visited << temp
            word_list << temp
          end
        end
      end
    end
  end
end

time = Time.now
#running ruby file takes dictionary name as argument, i.e. ruby levenshtein_dinstance.rb dictionary.txt
social_words = SocialWords.new(ARGV[0])
p social_words.get_social_network_count('listy')
#Time it takes to load dictionary and execute
p Time.now - time