require "benchmark"

def solution(a)
  uniques = {}

  return a[0] if a.size == 1

  a.each do |item|
    if uniques.has_key?(item)
      uniques.delete(item)
    else
      uniques[item] = item
    end
  end

  return uniques.keys[0] if uniques.size == 1
  nil
end

puts "solution([1]) should = 1: #{solution([1])}"
puts "solution([1,3,1]) should = 3: #{solution([1,3,1])}"
puts "solution([1,3,3,3,1]) should = 3: #{solution([1,3,3,3,1])}"
puts "solution([9,3,9,3,9,7,9]) should = 7: #{solution([9,3,9,3,9,7,9])}"
puts "solution([]) should = nil: #{solution([])}"
puts "solution([1,1,1,1]) should = nil: #{solution([1,1,1,1])}"
puts "solution([1,1,1,3,3,3]) should = nil: #{solution([1,1,1,3,3,3])}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for finding odd occurrences in an array"

N=50_000

Benchmark.bm(30) do |x|
  x.report("solution([1])")             { N.times { solution([1]) } }
  x.report("solution([1,3,1])")         { N.times { solution([1,3,1]) } }
  x.report("solution([1,3,3,3,1])")     { N.times { solution([1,3,3,3,1]) } }
  x.report("solution([9,3,9,3,9,7,9])") { N.times { solution([9,3,9,3,9,7,9]) } }
  x.report("solution([])")              { N.times { solution([]) } }
  x.report("solution([1,1,1,1])")       { N.times { solution([1,1,1,1]) } }
  x.report("solution([1,1,1,3,3,3])")   { N.times { solution([1,1,1,3,3,3]) } }
end

