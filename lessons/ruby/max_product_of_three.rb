require "benchmark"

def solution(a)
  length = a.size
  maxes = [a[0],a[1],a[2]]
  maxes.sort!.reverse!
  mins = [maxes[2],maxes[1]].map {|item| item > 0 ? 0 : item }

  i = 3
  while i < length
    item = a[i]
    if item > maxes[0]
      maxes[2] = maxes[1]
      maxes[1] = maxes[0]
      maxes[0] = item
    elsif item > maxes[1]
      maxes[2] = maxes[1]
      maxes[1] = item
    elsif item > maxes[2]
      maxes[2] = item
    end
    if item < mins[0]
      mins[1] = mins[0]
      mins[0] = item
    elsif item < mins[1]
      mins[1] = item
    end
    i += 1
  end

  calc1 = maxes[0] * maxes[1] * maxes[2]
  calc2 = maxes[0] * mins[0] * mins[1]

  return calc1 > calc2 ? calc1 : calc2
end

fwd_arr = Array.new(1000) {|n| n }
rev_arr = Array.new(1000) {|n| 1000 - n }
neg_arr = Array.new(1000) {|n| -1 - n }
med_arr1 = Array.new(500) {|n| n * [1, -1].sample }
med_arr2 = Array.new(2500) {|n| 2500 - n * [-1, 1].sample }
big_arr = Array.new(10000) {|n| 10000 - n * [-1, 1].sample }

puts "solution([1,2,3]) should = 6: #{solution([1,2,3])}"
puts "solution([1,1,2,2,1]) should = 4: #{solution([1,1,2,2,1])}"
puts "solution([1,2,3,4,5,6,7]) should = 210: #{solution([1,2,3,4,5,6,7])}"
puts "solution([0, 0, -5]) should = 0: #{solution([0, 0, -5])}"
puts "solution([1, 0, -5, -3]) should = 15: #{solution([1, 0, -5, -3])}"
puts "solution([-5, 5, -5, 4]) should = 125: #{solution([-5, 5, -5, 4])}"
puts "solution([-5, -6, -4, -7, -10]) should = -120: #{solution([-5, -6, -4, -7, -10])}"
puts "solution([1,1,1,1,1,1,1,1,1,1,1]) should = 1: #{solution([1,1,1,1,1,1,1,1,1,1,1])}"
puts "solution(fwd_arr) should = []: #{solution(fwd_arr)}"
puts "solution(rev_arr) should = []: #{solution(rev_arr)}"
puts "solution(neg_arr) should = []: #{solution(neg_arr)}"
puts "solution(med_arr1) should = []: #{solution(med_arr1)}"
puts "solution(med_arr2) should = []: #{solution(med_arr2)}"
puts "solution(big_arr) should = []: #{solution(big_arr)}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for max product of three"

N=10_000

Benchmark.bm(35) do |x|
  x.report("solution([1,2,3])")                 { N.times { solution([1,2,3]) } }
  x.report("solution([1,1,2,2,1])")             { N.times { solution([1,1,2,2,1]) } }
  x.report("solution([1,2,3,4,5,6,7])")         { N.times { solution([1,2,3,4,5,6,7]) } }
  x.report("solution([1,1,1,1,1,1,1,1,1,1,1])") { N.times { solution([1,1,1,1,1,1,1,1,1,1,1]) } }
  x.report("solution(fwd_arr)")                 { N.times { solution(fwd_arr) } }
  x.report("solution(rev_arr)")                 { N.times { solution(rev_arr) } }
  x.report("solution(neg_arr)")                 { N.times { solution(neg_arr) } }
  x.report("solution(med_arr1)")                { N.times { solution(med_arr1) } }
  x.report("solution(med_arr2)")                { N.times { solution(med_arr2) } }
  x.report("solution(big_arr)")                 { N.times { solution(big_arr) } }
end if false

if false
    if item > maxes[2]
      if item > maxes[1]
        if item > maxes[0]
          maxes[2] = maxes[1]
          maxes[1] = maxes[0]
          maxes[0] = item
        else
          maxes[2] = maxes[1]
          maxes[1] = item
        end
      else
        maxes[2] = item
      end
    end
end

