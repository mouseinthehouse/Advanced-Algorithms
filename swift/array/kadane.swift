// Brute Force: O(n^2)
func bruteForce(_ nums: [Int]) -> Int {
  var maxSum = nums[0]

  for i in 0..<nums.count {
    var curSum = 0
    for j in i..<nums.count {
      curSum += nums[j]
      maxSum = max(maxSum, curSum)
    }
  }
  return maxSum
}

// Kadane's Algorithm: O(n)
func kadanes(_ nums: [Int]) -> Int {
  var maxSum = nums[0]
  var curSum = 0

  for n in nums {
    curSum = max(curSum, 0)
    curSum += n
    maxSum = max(maxSum, curSum)
  }
  return maxSum
}

// Return the left and right index of the max subarray sum,
// assuming there's exactly one result (no ties).
// Sliding window variation of Kadane's: O(n)
func slidingWindow(_ nums: [Int]) -> [Int] {
  var maxSum = nums[0]
  var curSum = 0
  var maxL = 0, maxR = 0
  var L = 0

  for R in 0..<nums.count {
    if curSum < 0 {
      curSum = 0
      L = R
    }

    curSum += nums[R]
    if curSum > maxSum {
      maxSum = curSum
      maxL = L
      maxR = R
    }
  }

  return [maxL, maxR]
}