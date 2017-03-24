require "benchmark"

def solution(s)
  length = s.size
  nesting = 0
  i = 0
  while i < length
    ch = s[i]
    if ch == '('
      nesting += 1
    else
      return 0 if nesting == 0
      nesting -= 1
    end
    i += 1
  end

  return nesting == 0 ? 1 : 0
end

medium1 = ("(" * 500) + (")" * 500)
medium2 = ("(" * 2500) + (")" * 2500)
long    = ("(" * 10000) + (")" * 10000)

puts "solution('') should = 1: #{solution('')}"
puts "solution('()') should = 1: #{solution('()')}"
puts "solution('(())') should = 1: #{solution('(())')}"
puts "solution(')') should = 0: #{solution(')')}"
puts "solution('(') should = 0: #{solution('(')}"
puts "solution('())') should = 0: #{solution('())')}"
puts "solution('(()(())())') should = 1: #{solution('(()(())())')}"
puts "solution(medium1) should = 1: #{solution(medium1)}"
puts "solution(medium1+'(') should = 0: #{solution(medium1+'(')}"
puts "solution(medium2) should = 1: #{solution(medium2)}"
puts "solution(medium2+')') should = 0: #{solution(medium2+')')}"
puts "solution(long) should = 1: #{solution(long)}"
puts "solution(long+'(') should = 0: #{solution(long+'(')}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for genomic range query"

N=10_000

Benchmark.bm(30) do |x|
  x.report("solution('')")             { N.times { solution('') } }
  x.report("solution('())')")          { N.times { solution('())') } }
  x.report("solution('(()(())())')")   { N.times { solution('(()(())())') } }
  x.report("solution(medium1)")        { N.times { solution(medium1) } }
  x.report("solution(medium2)")        { N.times { solution(medium2) } }
  x.report("solution(long)")           { N.times { solution(long) } }
end

