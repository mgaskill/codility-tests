require "benchmark"

def solution(s,p,q)
  length = s.size
  a = [0] * (length+1)
  c = [0] * (length+1)
  g = [0] * (length+1)

  i = 0
  while i < length
    n = i+1
    a[n] = a[i]
    c[n] = c[i]
    g[n] = g[i]
    case s[i]
    when 'A' then a[n] = a[i] + 1
    when 'C' then c[n] = c[i] + 1
    when 'G' then g[n] = g[i] + 1
    end
    i += 1
  end

  m = p.size
  results = [0] * m
  i = 0
  while i < m
    first = p[i]
    last = q[i]+1
    results[i] = case
      when a[last] > a[first] then 1
      when c[last] > c[first] then 2
      when g[last] > g[first] then 3
      else                         4
    end
    i += 1
  end
  return results
end

nucleotides = ['A', 'C', 'G', 'T']

med_arr1 = Array.new(500) { nucleotides.sample }
med_arr2 = Array.new(2500) { nucleotides.sample }
big_arr = Array.new(10000) { nucleotides.sample }

med_p1 = Array.new(med_arr1.size) { rand(0...(med_arr1.size)) }
med_p2 = Array.new(med_arr2.size) { rand(0...(med_arr2.size)) }
big_p = Array.new(big_arr.size) { rand(0...(big_arr.size)) }

med_q1 = Array.new(med_arr1.size) {|n| rand((med_p1[n])...(med_arr1.size)) }
med_q2 = Array.new(med_arr2.size) {|n| rand((med_p2[n])...(med_arr2.size)) }
big_q = Array.new(big_arr.size) {|n| rand((big_p[n])...(big_arr.size)) }

puts "solution('CAGCCTA', [0], [0]) should = [2]: #{solution('CAGCCTA', [0], [0])}"
puts "solution('CAGCCTA', [6], [6]) should = [1]: #{solution('CAGCCTA', [6], [6])}"
puts "solution('CAGCCTA', [2,5,0], [4,5,6]) should = [2,4,1]: #{solution('CAGCCTA', [2,5,0], [4,5,6])}"
# puts "solution(med_arr1) should = []: #{solution(med_arr1, med_p1, med_q1).size}"
# puts "solution(med_arr2) should = []: #{solution(med_arr2, med_p2, med_q2).size}"
# puts "solution(big_arr) should = []: #{solution(big_arr, big_p, big_q).size}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for genomic range query"

N=10_000

Benchmark.bm(30) do |x|
  x.report("solution('CAGCCTA', [0], [0])")          { N.times { solution('CAGCCTA', [0], [0]) } }
  x.report("solution('CAGCCTA', [6], [6])")          { N.times { solution('CAGCCTA', [6], [6]) } }
  x.report("solution('CAGCCTA', [2,5,0], [4,5,6])")  { N.times { solution('CAGCCTA', [2,5,0], [4,5,6]) } }
  x.report("solution(med_arr1, med_p1, med_q1)")     { N.times { solution(med_arr1, med_p1, med_q1) } }
  x.report("solution(med_arr2, med_p2, med_q2)")     { N.times { solution(med_arr2, med_p2, med_q2) } }
  x.report("solution(big_arr, big_p, big_q)")        { N.times { solution(big_arr, big_p, big_q) } }
end

