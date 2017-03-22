require "benchmark"

def solution(a,b,k)
  b/k - a/k + ((a%k) == 0 ? 1:0);
end

counter_arr = [0] * 5000 ; (counter_arr.size).times {|n| counter_arr[n] = n }

med_arr1 = [1] * 500 ; (med_arr1.size).times {|n| med_arr1[n] = counter_arr.slice(1,6).sample }
med_arr2 = [1] * 2500 ; (med_arr2.size).times {|n| med_arr2[n] = counter_arr.slice(1,6).sample }
big_arr = [1] * 10000 ; (big_arr.size).times {|n| big_arr[n] = counter_arr.slice(1,6).sample }

puts "solution(0,0,11) should = [1]: #{solution(0,0,11)}"
puts "solution(10,10,3) should = [0]: #{solution(10,10,3)}"
puts "solution(10,10,5) should = [1]: #{solution(10,10,5)}"
puts "solution(10,10,7) should = [0]: #{solution(10,10,7)}"
puts "solution(10,10,20) should = [0]: #{solution(10,10,20)}"
puts "solution(10,20,2) should = [6]: #{solution(10,20,2)}"
puts "solution(6,11,2) should = [3]: #{solution(6,11,2)}"
puts "solution(1,11,2) should = [5]: #{solution(1,11,2)}"
puts "solution(2,9,3) should = [3]: #{solution(2,9,3)}"
puts "solution(2,10,3) should = [3]: #{solution(2,10,3)}"
puts "solution(100,123_450_100,10_000) should = [12345]: #{solution(100,123_450_100,10_000)}"
puts "solution(101, 123456789, 10000) should = [12345]: #{solution(101, 123456789, 10000)}"
puts "solution(5,900_000_000,15) should = [60000000]: #{solution(5,900_000_000,15)}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for count div"

N=10_000
max_counters = [50]*10000
max_max_counters = [51]*10000
max_max = [0] * 10000 ; (max_max.size).times {|n| counter_arr.slice(1,51).sample }

Benchmark.bm(30) do |x|
  x.report("solution(0,0,11)")               { N.times { solution(0,0,11) } }
  x.report("solution(10,10,3)")              { N.times { solution(10,10,3) } }
  x.report("solution(10,20,2)")              { N.times { solution(10,20,2) } }
  x.report("solution(6,11,2)")               { N.times { solution(6,11,2) } }
  x.report("solution(1,11,2)")               { N.times { solution(1,11,2) } }
  x.report("solution(2,9,3)")                { N.times { solution(2,9,3) } }
  x.report("solution(5,900_000_000,15)")     { N.times { solution(5,900_000_000,15) } }
end if false

