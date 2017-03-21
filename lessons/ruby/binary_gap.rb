require "benchmark"

def solution(n)
  longest = 0

  while ((n & 1) == 0) && (n > 0)
    n >>= 1
  end

  while (n > 0)
    current = 0

    while ((n & 1) == 1)
      n >>= 1
    end

    while (((n & 1) == 0) && (n > 0))
      current += 1
      n >>= 1
    end

    longest = current if current > longest
  end

  longest
end

puts "solution(0) should = 0: #{solution(0)}"
puts "solution(8) should = 0: #{solution(8)}"
puts "solution(9) should = 2: #{solution(9)}"
puts "solution(15) should = 0: #{solution(15)}"
puts "solution(20) should = 1: #{solution(20)}"
puts "solution(529) should = 4: #{solution(529)}"
puts "solution(1041) should = 5: #{solution(1041)}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for calculating maximum bit gaps"

N=500_000

Benchmark.bm(20) do |x|
  x.report("solution(0)")    { N.times { solution(0) } }
  x.report("solution(8)")    { N.times { solution(8) } }
  x.report("solution(9)")    { N.times { solution(9) } }
  x.report("solution(15)")   { N.times { solution(15) } }
  x.report("solution(20)")   { N.times { solution(20) } }
  x.report("solution(529)")  { N.times { solution(529) } }
  x.report("solution(1041)") { N.times { solution(1041) } }
end

