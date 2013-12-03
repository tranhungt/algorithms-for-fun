require 'set'
def jollyJumper(numbers)
  if (numbers.length == 1)
    puts 'Jolly'
    return
  end
  set = (1...numbers.length).to_set

  0.upto(numbers.length() -2) do |i|
    diff = (numbers[i] - numbers[i+1]).abs
    if !set.include?(diff)
      puts 'Not jolly'
      return
    end
    set.delete(diff)
  end
    puts 'Jolly'
end
num = 0
File.open(ARGV[0]).each do |line|
  if num == 0
    puts 'Jolly'
    num += 1
  else
    jollyJumper(line.split(' ').map{|num| num.to_i})
  end
end