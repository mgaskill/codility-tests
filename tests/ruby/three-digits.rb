# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(s)
  str = s.gsub(/\D+/, '')
  len = str.size
  threes = len / 3
  threes -= 1 if len % 3 == 1
  
  counts = ([3] * threes) + ([2] * ((len - (3 * threes)) / 2))
  pos = 0
  return counts.map do |count|
    temp = str.slice(pos, count)
    pos += count
    temp
  end.join('-')
end

puts "Solution: '55' should be '55': #{solution('55')}"
puts "Solution: '555-37-26' should be '555-37-26': #{solution('555-37-26')}"
puts "Solution: '555 37 265' should be '555-372-65': #{solution('555 37 265')}"
puts "Solution: '5   553  - 72654--' should be '555-372-654': #{solution('5   553  - 72654--')}"
puts "Solution: '5553726549' should be '555-372-65-49': #{solution('5553726549')}"
puts "Solution: '55537265491' should be '555-372-654-91': #{solution('55537265491')}"
puts "Solution: '1..100' should be '123-456-78-90': #{solution('1234567890'*10)}"

