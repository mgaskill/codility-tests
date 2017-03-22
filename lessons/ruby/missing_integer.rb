require "benchmark"

def solution(a)
  length = a.size
  items = [false] * length
  a.each do |item|
    items[item-1] = true if item <= length && item > 0
  end
  index = items.find_index {|elem| !elem }
  (index || length) + 1
end

med_arr = ([1] * 250) + [3,4,5]
long_arr = [0] * 100_000 ; (long_arr.size).times {|n| long_arr[n] = n }

puts "solution([0]) should = 1: #{solution([0])}"
puts "solution([1]) should = 2: #{solution([1])}"
puts "solution([-1]) should = 1: #{solution([-1])}"
puts "solution([1,3,3,3,2]) should = 4: #{solution([1,3,3,3,2])}"
puts "solution([3,3,3,2]) should = 1: #{solution([3,3,3,2])}"
puts "solution([1,2,3,4]) should = 5: #{solution([1,2,3,4])}"
puts "solution([-1,-2,-5,1,2,3,4]) should = 5: #{solution([-1,-2,-5,1,2,3,4])}"
puts "solution(med_arr) should = 2: #{solution(med_arr)}"
puts "solution(long_arr) should = 100000: #{solution(long_arr)}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for frog river one"

N=10_000

Benchmark.bm(30) do |x|
  x.report("solution([0])")                { N.times { solution([0]) } }
  x.report("solution([1])")                { N.times { solution([1]) } }
  x.report("solution([-1])")               { N.times { solution([-1]) } }
  x.report("solution([1,3,3,3,2])")        { N.times { solution([1,3,3,3,2]) } }
  x.report("solution([3,3,3,2])")          { N.times { solution([3,3,3,2]) } }
  x.report("solution([1,3,4,2])")          { N.times { solution([1,3,4,2]) } }
  x.report("solution([-1,-2,-5,1,3,4,2])") { N.times { solution([-1,-2,-5,1,3,4,2]) } }
  x.report("solution(med_arr)")            { N.times { solution(med_arr) } }
end

