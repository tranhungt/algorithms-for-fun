def fizzbuzz(inputs)
  div1 = inputs[0]
  div2 = inputs[1]
  max = inputs[2]
  array = (1..max).to_a
  
  div1.step(max,div1) do |i|
    array[i - 1] = 'F'
  end
  div2.step(max,div2) do |i|
    if(i % div1 == 0)
      array[i - 1] = 'FB'
    else
      array[i - 1] = 'B'
    end
  end
  puts array.join(' ')
end

File.open(ARGV[0]).each do |line|
  inputs = line.split(' ').map{|num| num.to_i}
  fizzbuzz(inputs)
end