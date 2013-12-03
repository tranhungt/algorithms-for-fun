def longest_lines(lines, n)
  lines = mergeSort(lines)
  lines[0,n].each do |line|
    puts line
  end
end

def mergeSort(lines)
  return lines if lines.length <= 1
  left = lines[0, lines.length / 2]
  right = lines[lines.length / 2, lines.length]
  merge(mergeSort(left), mergeSort(right))
end

def merge(left, right)
  total = []
  until left.length == 0 || right.length == 0
    if left.first.length > right.first.length
      total << left.shift
    else
      total << right.shift
    end
  end
  total + left + right
end

def run
  lines = []
  n = 0;
  i = 0
  File.open(ARGV[0]).each do |line|
    if i == 0
      n = line.to_i
      i += 1
      next
    end
    i += 1
    lines << line.strip
  end
  longest_lines(lines, n)
end

run