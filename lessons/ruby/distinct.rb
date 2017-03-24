require "benchmark"

def solution(a)
  length = a.size
  numbers = {}
  i = 0
  while i < length
    item = a[i]
    numbers[item] = item if !numbers.has_key?(item)
    i += 1
  end
  return numbers.size
end

puts "solution([]) should = 0: #{solution([])}"
puts "solution([1]) should = 1: #{solution([1])}"
puts "solution([1,1]) should = 1: #{solution([1,1])}"
puts "solution([1,2]) should = 2: #{solution([1,2])}"
puts "solution([1,1,2,2,1]) should = 2: #{solution([1,1,2,2,1])}"
puts "solution([1,2,3,4,5,6,7]) should = 7: #{solution([1,2,3,4,5,6,7])}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for genomic range query"

N=10_000

Benchmark.bm(30) do |x|
  x.report("solution([])")                      { N.times { solution([]) } }
  x.report("solution([1])")                     { N.times { solution([1]) } }
  x.report("solution([1,1])")                   { N.times { solution([1,1]) } }
  x.report("solution([1,2])")                   { N.times { solution([1,2]) } }
  x.report("solution([1,1,2,2,1])")             { N.times { solution([1,1,2,2,1]) } }
  x.report("solution([1,2,3,4,5,6,7])")         { N.times { solution([1,2,3,4,5,6,7]) } }
  x.report("solution([1,1,1,1,1,1,1,1,1,1,1])") { N.times { solution([1,1,1,1,1,1,1,1,1,1,1]) } }
end

