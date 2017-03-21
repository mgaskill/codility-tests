require "benchmark"

def solution(a, k)
  length = a.size
  return a if length < 2

  k = k % length
  return a if k == 0

  first = a.slice(0..(length-k-1))
  last = a.slice(-k...length)

  return last + first
end

puts "solution([], 1) should = []: #{solution([], 1)}"
puts "solution([1], 1) should = [1]: #{solution([1], 1)}"
puts "solution([1,2], 1) should = [2,1]: #{solution([1,2], 1)}"
puts "solution([1,2,3], 2) should = [2,3,1]: #{solution([1,2,3], 2)}"
puts "solution([1,2,3,4,5,6,7], 0) should = [1,2,3,4,5,6,7]: #{solution([1,2,3,4,5,6,7], 0)}"
puts "solution([1,2,3,4,5,6,7], 6) should = [2,3,4,5,6,7,1]: #{solution([1,2,3,4,5,6,7], 6)}"
puts "solution([1,2,3,4,5,6,7], 7) should = [1,2,3,4,5,6,7]: #{solution([1,2,3,4,5,6,7], 7)}"
puts "solution([1,2,3,4,5,6,7], 8) should = [7,1,2,3,4,5,6]: #{solution([1,2,3,4,5,6,7], 8)}"
puts "solution([1,2,3,4,5,6,7], 20) should = [2,3,4,5,6,7,1]: #{solution([1,2,3,4,5,6,7], 20)}"
puts "solution([3,8,9,7,6], 3) should = [9,7,6,3,8]: #{solution([3,8,9,7,6], 3)}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for cyclic rotation of an array"

N=50_000

Benchmark.bm(30) do |x|
  x.report("solution([],1)")               { N.times { solution([],1) } }
  x.report("solution([1],1)")              { N.times { solution([1],1) } }
  x.report("solution([1,2],1)")            { N.times { solution([1,2],1) } }
  x.report("solution([1,2,3],2)")          { N.times { solution([1,2,3],2) } }
  x.report("solution([1,2,3,4,5,6,7],0)")  { N.times { solution([1,2,3,4,5,6,7],0) } }
  x.report("solution([1,2,3,4,5,6,7],6)")  { N.times { solution([1,2,3,4,5,6,7],6) } }
  x.report("solution([1,2,3,4,5,6,7],7)")  { N.times { solution([1,2,3,4,5,6,7],7) } }
  x.report("solution([1,2,3,4,5,6,7],8)")  { N.times { solution([1,2,3,4,5,6,7],8) } }
  x.report("solution([1,2,3,4,5,6,7],20)") { N.times { solution([1,2,3,4,5,6,7],20) } }
end

