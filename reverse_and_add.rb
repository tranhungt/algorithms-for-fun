def reverseAndAdd(num)
  count = 0
  if isPalindrome(num)
    puts "#{count} #{num}" 
  else
    while(!isPalindrome(num))
      num += num.to_s.reverse.to_i
      count += 1
    end
    puts "#{count} #{num}"
  end

end

def isPalindrome(num)
  num.to_s == num.to_s.reverse
end

File.open(ARGV[0]).each do |line|
  reverseAndAdd(line.to_i)
end
