require "benchmark"

def solution(a)
  length = a.size
  car = 0
  cars = 0
  count = 0
  while car < length
    if a[car] == 0
      cars += 1
    else
      count += cars
    end
    car += 1
  end
  return count > 1_000_000_000 ? -1 : count
end

counter_arr = [0] * 5000 ; (counter_arr.size).times {|n| counter_arr[n] = n }

med_arr1 = [1] * 500 ; (med_arr1.size).times {|n| med_arr1[n] = counter_arr.slice(1,6).sample }
med_arr2 = [1] * 2500 ; (med_arr2.size).times {|n| med_arr2[n] = counter_arr.slice(1,6).sample }
big_arr = [1] * 10000 ; (big_arr.size).times {|n| big_arr[n] = counter_arr.slice(1,6).sample }

puts "solution([1]) should = [0]: #{solution([1,0])}"
puts "solution([1,0]) should = [0]: #{solution([1,0])}"
puts "solution([0,1,0,1]) should = [3]: #{solution([0,1,0,1])}"
puts "solution([0,1,0,1,1,1,1,1,1]) should = [13]: #{solution([0,1,0,1,1,1,1,1,1])}"

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
  x.report("solution([1])")                     { N.times { solution([1]) } }
  x.report("solution([1,0])")                   { N.times { solution([1,0]) } }
  x.report("solution([0,1,0,1])")               { N.times { solution([0,1,0,1]) } }
  x.report("solution([0,1,0,1,1,1,1,1,1])")     { N.times { solution([0,1,0,1,1,1,1,1,1]) } }
end

