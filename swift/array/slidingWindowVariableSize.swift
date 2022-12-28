// Find the length of longest subarray with the same 
// value in each position: O(n)
func longestSubarray(_ nums: [Int]) -> Int {
  var length = 0
  var L = 0

  for R in 0..<nums.count {
    if nums[L] != nums[R] {
      L = R
    }
    length = max(length, R - L + 1)
  }
  return length
}

// Find length of the minimum size subarray where the sum is 
// greater than or equal to the target.
// Assume all values in the input are positive.
// O(n)
func shortestSubarray(_ nums: [Int], _ target: Int) -> Int {
  var L = 0, total = 0
  var length = Int.max 

  for R in 0..<nums.count {
    total += nums[R]
    while total >= target {
      length = min(R - L + 1, length)
      total -= nums[L]
      L += 1
    }
  }
  return length == Int.max ? 0 : length
}
