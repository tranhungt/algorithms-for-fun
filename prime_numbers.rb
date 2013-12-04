#Finds all primes under n

def primes(n)
  arr = (0..n).to_a
  arr[0] = nil;
  arr[1] = nil;
  2.upto(Math.sqrt(n) +1) do |i|
    (i**2).step(n, i) do |k|
      arr[k] = nil
    end
  end
  arr.compact!
  return arr.join(',')

end


File.open(ARGV[0]).each do | number |
  number = number.gsub(',', '').to_i

  if(number > 1)
    puts primes(number)
  end
end

