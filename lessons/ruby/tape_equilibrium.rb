require "benchmark"

def solution(a)
  length = a.size
  min_diff = nil
  part1 = 0
  part2 = a.inject(0,:+)
  for i in 1..(length-1)
    value = a[i-1]
    part1 += value
    part2 -= value
    diff = (part1 - part2).abs
    min_diff = diff if !min_diff || diff < min_diff
  end
  min_diff
end

puts "solution([1,10]) should = 9: #{solution([1,10])}"
puts "solution([1,5,10]) should = 4: #{solution([1,5,10])}"
puts "solution([1000,50,100]) should = 850: #{solution([1000,50,100])}"
puts "solution([3,1,2,4,3]) should = 1: #{solution([3,1,2,4,3])}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for cyclic rotation of an array"

N=50_000

Benchmark.bm(30) do |x|
  x.report("solution([1,10])")        { N.times { solution([1,10]) } }
  x.report("solution([1,5,10])")      { N.times { solution([1,5,10]) } }
  x.report("solution([1000,50,100])") { N.times { solution([1000,50,100]) } }
  x.report("solution([3,1,2,4,3])")   { N.times { solution([3,1,2,4,3]) } }
end

