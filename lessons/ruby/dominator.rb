require "benchmark"

def solution(a)
  length = a.size
  half = length / 2
  indices = {}
  i = 0
  while i < length
    item = a[i]
    j = i + 1
    while j < length && a[j] == item
      j += 1
    end
    n = j - i
    count = (length - j) + n
    if indices.has_key?(item)
      if (count + indices[item][0]) < half
        indices.delete(item)
      else
        indices[item][0] += n
      end
    else
      indices[item] = [n, i] if count >= half
    end
    i += n
  end

  indices.delete_if do |key,item|
    item[0] <= half
  end

  return indices.size > 0 ? indices.first[1][1] : -1
end

medium1 = [3] + Array.new(250) {|n| [0,1,2,3,4,5,6,7,8,9,10].sample } + ([3] * 250)
medium2 = [5] + Array.new(1250) {|n| [0,1,2,3,4,5,6,7,8,9,10].sample } + ([5] * 1250)
long = [7] + Array.new(5000) {|n| [0,1,2,3,4,5,6,7,8,9,10].sample } + ([7] * 5000)

puts "solution([]) should = -1: #{solution([])}"
puts "solution([1]) should = 0: #{solution([1])}"
puts "solution([1,2,2]) should = 1: #{solution([1,2,2])}"
puts "solution([1,2,3]) should = -1: #{solution([1,2,3])}"
puts "solution([1,2,1,2]) should = -1: #{solution([1,2,1,2])}"
puts "solution([1,2,3,3]) should = -1: #{solution([1,2,3,3])}"
puts "solution([1,2,3,3,3]) should = 2: #{solution([1,2,3,3,3])}"
puts "solution(medium1) should = 0: #{solution(medium1)}"
puts "solution(medium2) should = 0: #{solution(medium2)}"
puts "solution(long) should = 0: #{solution(long)}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for dominator"

N=10_000

Benchmark.bm(30) do |x|
  x.report("solution([])")             { N.times { solution([]) } }
  x.report("solution([1])")            { N.times { solution([1]) } }
  x.report("solution([1,2,2])")        { N.times { solution([1,2,2]) } }
  x.report("solution([1,2,3])")        { N.times { solution([1,2,3]) } }
  x.report("solution([1,2,1,2])")      { N.times { solution([1,2,1,2]) } }
  x.report("solution([1,2,3,3])")      { N.times { solution([1,2,3,3]) } }
  x.report("solution([1,2,3,3,3])")    { N.times { solution([1,2,3,3,3]) } }
end if false

