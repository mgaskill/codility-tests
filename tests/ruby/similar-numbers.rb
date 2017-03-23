# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(n)
  return 1 if n < 10
  str = n.to_s
  len = str.size
  non_zerostr = str.gsub(/0/, '')
  non_zeros = non_zerostr.size
  zeros = len - non_zeros
  unique = non_zerostr.split('').uniq.size

# puts " -- len: #{len} non-zero: #{non_zeros} zeros: #{zeros} unique: #{unique}"

  perms = (1..unique).inject(:*)
  perms += (perms * zeros) if perms > 1
  perms += (perms * (non_zeros - unique))

  return perms
end

# non-duplicating digits, without zeros
puts "Solution: 1 should be 1: #{solution(1)}"
puts "Solution: 12 should be 2: #{solution(12)}"
puts "Solution: 123 should be 6: #{solution(123)}"
puts "Solution: 1234 should be 24: #{solution(1234)}"
puts "Solution: 12345 should be 120: #{solution(12345)}"

# non-duplicating digits, with zeros
puts "Solution: 0 should be 1: #{solution(0)}"
puts "Solution: 10 should be 1: #{solution(20)}"
puts "Solution: 100 should be 1: #{solution(100)}"
puts "Solution: 120 should be 4: #{solution(120)}"
puts "Solution: 1000 should be 1: #{solution(1000)}"
puts "Solution: 1200 should be 6: #{solution(1200)}"
puts "Solution: 1230 should be 12: #{solution(1230)}"
puts "Solution: 10000 should be 1: #{solution(10000)}"
puts "Solution: 12000 should be 8: #{solution(12000)}"
puts "Solution: 12300 should be 18: #{solution(12300)}"
puts "Solution: 12340 should be 48: #{solution(12340)}"

# duplicating digits, without zeros
puts "Solution: 1213 should be 12: #{solution(1213)}"

# duplicating digits, with zeros
puts "Solution: 110 should be 2: #{solution(110)}"


