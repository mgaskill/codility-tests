require "benchmark"

def solution(n,a)
  counters = [0] * (n+1)
  max_flag = n+1
  max_counter = 0
  current_min = 0
  a.each do |item|
    if item == max_flag
      current_min = max_counter
    else
      counters[item] = current_min if current_min > counters[item]
      counter = (counters[item] += 1)
      max_counter = counter if counter > max_counter
    end
  end
  counters.each.with_index do |counter,index|
    counters[index] = current_min if counters[index] < current_min
  end
  counters.slice(1,n)
end

counter_arr = [0] * 5000 ; (counter_arr.size).times {|n| counter_arr[n] = n }

med_arr1 = [1] * 500 ; (med_arr1.size).times {|n| med_arr1[n] = counter_arr.slice(1,6).sample }
med_arr2 = [1] * 2500 ; (med_arr2.size).times {|n| med_arr2[n] = counter_arr.slice(1,6).sample }
big_arr = [1] * 10000 ; (big_arr.size).times {|n| big_arr[n] = counter_arr.slice(1,6).sample }

puts "solution(1,[1,1,1,2]) should = [3]: #{solution(1,[1,1,1,2])}"
puts "solution(3,[1,1,1]) should = [3,0,0]: #{solution(3,[1,1,1])}"
puts "solution(4,[1,2,1,5]) should = [2,2,2,2]: #{solution(4,[1,2,1,5])}"
puts "solution(3,[1,2,1,4,2,2,4,1]) should = [5,4,4]: #{solution(3,[1,2,1,4,2,2,4,1])}"
puts "solution(50,[50] * 10000) should = []: #{solution(50,[50] * 10000).inspect}"
puts "solution(5,med_arr1) should = []: #{solution(5,med_arr1).inspect}"
puts "solution(5,med_arr2) should = []: #{solution(5,med_arr2).inspect}"
puts "solution(5,big_arr) should = []: #{solution(5,big_arr).inspect}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for max counters"

N=10_000
max_counters = [50]*10000
max_max_counters = [51]*10000
max_max = [0] * 10000 ; (max_max.size).times {|n| counter_arr.slice(1,51).sample }

Benchmark.bm(30) do |x|
  x.report("solution(3,[1,1,1])")                { N.times { solution(3,[1,1,1]) } }
  x.report("solution(4,[1,2,1,5])")              { N.times { solution(4,[1,2,1,5]) } }
  x.report("solution(3,[1,2,1,4,2,2,4,1])")      { N.times { solution(3,[1,2,1,4,2,2,4,1]) } }
  x.report("solution(5,med_arr1)")               { N.times { solution(5,med_arr1) } }
  x.report("solution(5,med_arr2)")               { N.times { solution(5,med_arr2) } }
#  x.report("solution(5,big_arr)")                { N.times { solution(5,big_arr) } }
  x.report("solution(50,max_counters)")          { N.times { solution(50,max_counters) } }
  x.report("solution(50,max_max_counters)")      { N.times { solution(50,max_max_counters) } }
  x.report("solution(50,max_max)")               { N.times { solution(50,max_max) } }
end

