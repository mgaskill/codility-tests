# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
  len = a.size
  swaps = 0
  i = 0
  while i < len
    smallest = a[i]
    largest = a[i]
    j = i + 1
    while j < len && largest > a[j]
      smallest = a[j] if a[j] < smallest
      j += 1
    end
    i -= 1 while i > 0 && a[i-1] > smallest
    swaps = j - i if j > i + 1
    i = j
  end
  return swaps
end

large_arr = Array.new(100_000) {|n| 100_000 - n }

puts "Solution: [1] should be 0: #{solution([1])}"
puts "Solution: [1,2] should be 0: #{solution([1,2])}"
puts "Solution: [2,1] should be 2: #{solution([2,1])}"
puts "Solution: [1,2,3] should be 0: #{solution([1,2,3])}"
puts "Solution: [1,3,2] should be 2: #{solution([1,3,2])}"
puts "Solution: [3,2,1] should be 3: #{solution([3,2,1])}"
puts "Solution: [3,2,5,7,9] should be 2: #{solution([3,2,5,7,9])}"
puts "Solution: [2,5,9,7,8] should be 3: #{solution([2,5,9,7,8])}"
puts "Solution: [1,2,6,5,5,8,9] should be 3: #{solution([1,2,6,5,5,8,9])}"
puts "Solution: [1,2,3,4,5,6,7,8,9] should be 0: #{solution([1,2,3,4,5,6,7,8,9])}"
puts "Solution: [9,8,7,6,5,4,3,2,1] should be 9: #{solution([9,8,7,6,5,4,3,2,1])}"
puts "Solution: [1,7,8,9,6,5,2,3,4] should be 8: #{solution([1,7,8,9,6,5,2,3,4])}"
puts "Solution: [2,3,4,5,6,7,8,9,1] should be 9: #{solution([2,3,4,5,6,7,8,9,1])}"
puts "Solution: large_arr should be 100_000: #{solution(large_arr)}"


