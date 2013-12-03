def rec_fib(n)
  return [0] if n == 1
  return [0,1] if n == 2
  fib = rec_fib(n-1)
  return fib + [fib[-1] + fib[-2]]
end

p rec_fib(10)

def iter_fib(n)
  return [0] if n == 0
  return [0,1] if n == 1
  fibs = [0,1]
  until fibs.length == n
    fibs << fibs[-1] + fibs[-2]
  end
  return fibs
end

p iter_fib(10)

def euclids_gcd(q, p)
  return  q if p == 0
  r = q % p
  euclids_gcd(p, r)
end

p euclids_gcd(102, 21)