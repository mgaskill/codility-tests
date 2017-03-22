require "benchmark"

def solution(x, y, d)
  distance = y - x
  hops = distance / d
  return (x + (hops * d)) < y ? hops + 1 : hops
end

puts "solution(1, 100, 1) should = 99: #{solution(1, 100, 1)}"
puts "solution(0, 10, 10) should = 1: #{solution(0, 10, 10)}"
puts "solution(0, 3, 10) should = 1: #{solution(0, 3, 10)}"
puts "solution(4, 12, 3) should = 3: #{solution(4, 12, 3)}"
puts "solution(4, 13, 3) should = 3: #{solution(4, 13, 3)}"
puts "solution(4, 14, 3) should = 4: #{solution(4, 14, 3)}"
puts "solution(10, 85, 30) should = 3: #{solution(10, 85, 30)}"
puts "solution(1000, 1850, 10) should = 85: #{solution(1000, 1850, 10)}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for cyclic rotation of an array"

N=50_000

Benchmark.bm(30) do |x|
  x.report("solution(0,10,10)")      { N.times { solution(0,10,10) } }
  x.report("solution(0,3,10)")       { N.times { solution(0,3,10) } }
  x.report("solution(4,12,3)")       { N.times { solution(4,12,3) } }
  x.report("solution(4,13,3)")       { N.times { solution(4,13,3) } }
  x.report("solution(4,14,3)")       { N.times { solution(4,14,3) } }
  x.report("solution(10,85,30)")     { N.times { solution(10,85,30) } }
  x.report("solution(1000,1850,10)") { N.times { solution(1000,1850,10) } }
end

