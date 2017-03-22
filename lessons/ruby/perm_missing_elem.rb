require "benchmark"

def solution(a)
  result = nil
  length = a.size
  for i in 0..(length-1)
    while a[i] != (i+1)
      item = a[i]
      break if item >= length || a[item-1] == item

      a[i] = a[item-1]
      a[item-1] = item
    end
    result = i+1 if a[i] > length
  end
  result = length+1 if !result
  result
end

puts "solution([]) should = 1: #{solution([])}"
puts "solution([1]) should = 2: #{solution([1])}"
puts "solution([2]) should = 1: #{solution([2])}"
puts "solution([1,2]) should = 3: #{solution([1,2])}"
puts "solution([1,3]) should = 2: #{solution([1,3])}"
puts "solution([4,1,3]) should = 2: #{solution([4,1,3])}"
puts "solution([5,2,1,3]) should = 4: #{solution([5,2,1,3])}"
puts "solution([2,3,1,5]) should = 4: #{solution([2,3,1,5])}"
puts "solution([3,2,1,4]) should = 5: #{solution([3,2,1,4])}"
puts "solution([10,2,6,3,8,1,5,7,4]) should = 9: #{solution([10,2,6,3,8,1,5,7,4])}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for cyclic rotation of an array"

N=50_000

Benchmark.bm(30) do |x|
  x.report("solution([1,3])")                { N.times { solution([1,3]) } }
  x.report("solution([4,1,3])")              { N.times { solution([4,1,3]) } }
  x.report("solution([5,2,1,3])")            { N.times { solution([5,2,1,3]) } }
  x.report("solution([2,3,1,5])")            { N.times { solution([2,3,1,5]) } }
  x.report("solution([10,2,6,3,8,1,5,7,4])") { N.times { solution([10,2,6,3,8,1,5,7,4]) } }
end if false

