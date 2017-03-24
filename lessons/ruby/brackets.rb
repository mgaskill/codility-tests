require "benchmark"

def solution(s)
  matching = { '}' => '{', ']' => '[', ')' => '(' }

  length = s.size
  brackets = ""
  i = 0
  while i < length
    ch = s[i]
    case ch
    when '{', '[', '('
      brackets << ch
    when '}', ']', ')'
      return false if brackets[-1] != matching[ch]
      brackets.chop!
    end
    i += 1
  end

  return brackets.size == 0
end

medium1 = ("(" * 500) + (")" * 500)
medium2 = ("{" * 2500) + ("}" * 2500)
long    = ("[" * 10000) + ("]" * 10000)

puts "solution('') should = true: #{solution('')}"
puts "solution('{}') should = true: #{solution('{}')}"
puts "solution('([])') should = true: #{solution('([])')}"
puts "solution('}') should = false: #{solution('}')}"
puts "solution('([') should = false: #{solution('([')}"
puts "solution('([)') should = false: #{solution('([)')}"
puts "solution('()())') should = false: #{solution('()())')}"
puts "solution(medium1) should = true: #{solution(medium1)}"
puts "solution(medium1+'(') should = false: #{solution(medium1+'(')}"
puts "solution(medium2) should = true: #{solution(medium2)}"
puts "solution(medium2+'{') should = false: #{solution(medium2+'{')}"
puts "solution(long) should = true: #{solution(long)}"
puts "solution(long+'[') should = false: #{solution(long+'[')}"

puts ""
puts "============================================================"
puts RUBY_DESCRIPTION
puts "============================================================"
puts "Running tests for genomic range query"

N=10_000

Benchmark.bm(30) do |x|
  x.report("solution('')")             { N.times { solution('') } }
  x.report("solution('()[]{}')")       { N.times { solution('()[]{}') } }
  x.report("solution('()*3[]*3{}*3')") { N.times { solution('()()()[][][]{}{}{}') } }
  x.report("solution(medium1)")        { N.times { solution(medium1) } }
  x.report("solution(medium2)")        { N.times { solution(medium2) } }
  x.report("solution(long)")           { N.times { solution(long) } }
end

