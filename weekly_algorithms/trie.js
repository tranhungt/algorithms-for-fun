fs = require('fs');

function TrieNode(){
  this.word = "";
  this.word_count = 0;
  this.prefixes = 0;
  this.edges = {}
  debugger;
}

TrieNode.prototype.addWord = function(word, word_sequence){
  if (this.containsWord(word)){
    return false;
  }

  if (!word_sequence && word_sequence != ""){
    word_sequence = word;
  }

  if (word_sequence.length == 0){
    this.word = word;
    this.word_count += 1
  }
  else{
    this.word_count += 1;
    var letter = word_sequence[0];
    if (!this.edges[letter]){
      this.edges[letter] = new TrieNode();
    } 
    var new_word_sequence = word_sequence.slice(1, word_sequence.length);
    this.edges[letter].addWord(word, new_word_sequence)
  }
}

TrieNode.prototype.containsWord = function(word, word_sequence){
  if (!word_sequence){
    word_sequence = word;
  }

  if (this.word == word) {
    return true;
  }

  var letter = word_sequence[0];
  if (this.edges[letter]){
    var new_word_sequence = word_sequence.slice(1, word_sequence.length);
    return this.edges[letter].containsWord(word, new_word_sequence);
  }
  return false;
}

TrieNode.prototype.countWordsMatchingPrefix = function(prefix){
  if (prefix.length == 0){
    return this.word_count;
  }

  var letter = prefix[0];
  if (this.edges[letter]){
    var new_prefix = prefix.slice(1, prefix.length);
    return this.edges[letter].countWordsMatchingPrefix(new_prefix);
  }
  else {
    return 0;
  }
}

TrieNode.prototype.getWordsStartingWith = function(prefix){
  if (prefix.length == 0){
    return this.getAllFollowingWords();
  }

  var letter = prefix[0];
  if (this.edges[letter]){
    var new_prefix = prefix.slice(1, prefix.length)
    return this.edges[letter].getWordsStartingWith(new_prefix);
  }
}

TrieNode.prototype.getAllFollowingWords = function(){
  var following_words =  this.word == "" ? [] : [this.word]
  for (var edge in this.edges){
    following_words = following_words.concat(this.edges[edge].getAllFollowingWords())
  }

  return following_words;

}


var trie = new TrieNode();

//Import unix dictionary
unix_dict_file = '/usr/share/dict/words'
file = unix_dict_file;
fs.readFile(file,{encoding: 'utf-8'}, function(err, data){
  var words = data.split('\n');
  for (var i in words){
    trie.addWord(words[i]);
  }
})
set = new Set([])
fs.readFile(file,{encoding: 'utf-8'}, function(err, data) {set = new Set(data.split('\n'))})