// Check if array contains a pair of duplicate values,
// where the two duplicates are no farther than k positions from 
// each other (i.e. arr[i] == arr[j] and abs(i - j) + 1 <= k).
// O(n * k)
func closeDuplicatesBruteForce(_ nums: [Int], _ k: Int) -> Bool {
  for L in 0..<nums.count {
    for R in L + 1..<min(nums.count, L + k) {
      if nums[L] == nums[R] {
        return true
      }
    }
  }
  return false
}

// Same problem using sliding window.
// O(n)
func closeDuplicates(_ nums: [Int], _ k: Int) -> Bool {
  var window: Set<Int> = [] // Cur window of size <= k
  var L = 0

  for R in 0..<nums.count {
    if R - L + 1 > k {
      window.remove(nums[L])
      L += 1
    }
    if window.contains(nums[R]) {
      return true
    }
    window.insert(nums[R])
  }
  
  return false
}