#finds the longest increasing subsequence (not necessarily contiguous)
# in a sequence of numbers

def longest_subsequence(sequence)
  p sequence
  sequence.map!{|num| [num, [num]]}
  sequence.each_with_index do |value, curr_index|
    num, sub = value
    prev_subs = []
    curr_index.downto(0) do |k|
      if sequence[k][0] < num
        prev_subs << sequence[k][1]
      end
    end
    sequence[curr_index][1] = Array(prev_subs.max_by{|el| el.size}) + sequence[curr_index][1]
  end
  p sequence.max_by{|el| el[1].size}
end



sequence = [9,8,7,6,5,4,3,2,1,2]
rand_sequence = Array.new(100){(rand*100).to_i}
longest_subsequence(sequence)