# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
  len = a.size
  unique = {}
  i = 0
  while i < len
    item = a[i]
    if unique.has_key?(item)
      unique[item] += 1
    else
      unique[item] = 1
    end
    i += 1
  end
  pairs = 0
  unique.each do |key,count|
    (1...count).step {|n| pairs += n }
  end
  return pairs > 1_000_000_000 ? 1_000_000_000 : pairs
end


# identity pairs
puts "Solution: [] should be 0: #{solution([])}"
puts "Solution: [1,1] should be 1: #{solution([1,1])}"
puts "Solution: [1,1,1] should be 3: #{solution([1,1,1])}"
puts "Solution: [1,1,1,1] should be 6: #{solution([1,1,1,1])}"
puts "Solution: [1,1,1,1,1] should be 10: #{solution([1,1,1,1,1])}"
puts "Solution: [1,1,1,1,1,1] should be 15: #{solution([1,1,1,1,1,1])}"
puts "Solution: [1,1,1,1,1,1,1] should be 21: #{solution([1,1,1,1,1,1,1])}"
puts "Solution: [1,1,1,1,1,1,1,1] should be 28: #{solution([1,1,1,1,1,1,1,1])}"
puts "Solution: [1,1,1,1,1,1,1,1,1] should be 36: #{solution([1,1,1,1,1,1,1,1,1])}"

# mixed pairs
puts "Solution: [1,2,2,3] should be 1: #{solution([1,2,2,3])}"
puts "Solution: [1,1,2,2,3,3] should be 3: #{solution([1,1,2,2,3,3])}"
puts "Solution: [3,5,6,3,3,5] should be 4: #{solution([3,5,6,3,3,5])}"
puts "Solution: [1,1,1,2,2,2] should be 6: #{solution([1,1,1,2,2,2])}"
puts "Solution: [-1,1,-1,-2,2,-2] should be 2: #{solution([-1,1,-1,-2,2,-2])}"

med_arr1 = Array.new(1000) {|n| n % 7 }
med_arr2 = Array.new(5000) {|n| 0 - n }
large_arr = Array.new(100_000) {|n| n % 13 }

# edge cases
puts "Solution: [1,2] should be 0: #{solution([1,2])}"
puts "Solution: [1,2] should be 0: #{solution([1,2])}"

# larger data
puts "Solution: med_arr1 should be 70929: #{solution(med_arr1)}"
puts "Solution: med_arr2 should be 0: #{solution(med_arr2)}"
puts "Solution: large_arr should be 384565386: #{solution(large_arr)}"


