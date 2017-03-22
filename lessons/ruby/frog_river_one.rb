require "benchmark"

def solution(x,a)
  path = [false] * x
  start = 0
  a.each.with_index do |position,index|
    if position <= x && !path[position-1]
      path[position-1] = true
      while start < x
        break if path[start] == false
        start += 1
      end
      return index if start >= x
    end
  end
  -1
end

med_arr = ([1]*250)+[4,3,2]
long_arr = Array.new(100_000) ; (long_arr.size).times {|n| long_arr[n] = n }

puts "solution(3, [1]) should = -1: #{solution(3, [1])}"
puts "solution(3, [1,2,1,2,1,2,1,4]) should = -1: #{solution(3, [1,2,1,2,1,2,1,4])}"
puts "solution(5, [1,3,1,4,2,3,5,4]) should = 6: #{solution(5, [1,3,1,4,2,3,5,4])}"
puts "solution(4, [1,1,1,4,2,2,4,3]) should = 7: #{solution(4, [1,1,1,4,2,2,4,3])}"
puts "solution(4, med_arr) should = 252: #{solution(4, med_arr)}"
puts "solution(100_000, long_arr) should = 99_999: #{solution(100_000, long_arr)}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for frog river one"

N=10_000

Benchmark.bm(30) do |x|
  x.report("solution(3, [1])")                 { N.times { solution(3, [1]) } }
  x.report("solution(3, [1,2,1,2,1,2,1,4])")   { N.times { solution(3, [1,2,1,2,1,2,1,4]) } }
  x.report("solution(5, [1,3,1,4,2,3,5,4])")   { N.times { solution(5, [1,3,1,4,2,3,5,4]) } }
  x.report("solution(4, [1,1,1,2,2,2,4,3])")   { N.times { solution(4, [1,1,1,4,2,2,4,3]) } }
  x.report("solution(4, med_arr)")             { N.times { solution(4, med_arr) } }
end

