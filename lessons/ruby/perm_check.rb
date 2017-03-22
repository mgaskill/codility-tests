require "benchmark"

def solution(a)
  length = a.size
  counts = [0] * length

  a.each do |item|
    return false if item > length
    counts[item-1] += 1
  end
  counts.each do |item|
    return false if item != 1
  end
  return true
end

long_perm = Array.new(100_000) ; (long_perm.size).times {|n| long_perm[n] = n }

puts "solution([1]) should = true: #{solution([1])}"
puts "solution([2]) should = false: #{solution([2])}"
puts "solution([1,2]) should = true: #{solution([1,2])}"
puts "solution([1,10]) should = false: #{solution([1,10])}"
puts "solution([1,2,1]) should = false: #{solution([1,2,1])}"
puts "solution([1,2,3,4,5,6]) should = true: #{solution([1,2,3,4,5,6])}"
puts "solution([1,2,3,4,5,7]) should = false: #{solution([1,2,3,4,5,7])}"
puts "solution([1,2,3,4,5,4]) should = false: #{solution([1,2,3,4,5,4])}"
puts "solution([1,200_000,3,4,5,6]) should = false: #{solution([1,200_000,3,4,5,6])}"
puts "solution(long_perm) should = true: #{solution(long_perm)}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for permutation check of an array"

N=5_000

Benchmark.bm(30) do |x|
  x.report("solution([1])")                 { N.times { solution([1]) } }
  x.report("solution([2])")                 { N.times { solution([2]) } }
  x.report("solution([1,2])")               { N.times { solution([1,2]) } }
  x.report("solution([1,10])")              { N.times { solution([1,10]) } }
  x.report("solution([1,2,1])")             { N.times { solution([1,2,1]) } }
  x.report("solution([1,2,3,4,5,6])")       { N.times { solution([1,2,3,4,5,6]) } }
  x.report("solution([1,2,3,4,5,4])")       { N.times { solution([1,2,3,4,5,4]) } }
  x.report("solution([1,200_000,3,4,5,6])") { N.times { solution([1,200_000,3,4,5,6]) } }
  x.report("solution(long_perm)")           { N.times { solution(long_perm) } }
end if false

