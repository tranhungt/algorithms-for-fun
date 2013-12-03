@count = 0
def gcd(q, p)
  return q if p == 0
  r = q % p
  gcd(p, r)
end

puts gcd(105,50)
puts @count