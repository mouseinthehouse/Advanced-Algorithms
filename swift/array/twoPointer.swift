// Given a string of characters, return true if it's a palindrome,
// return false otherwise: O(n)
func isPalindrome(_ word: String) -> Bool {
  var L = 0, R = word.count - 1
  while L < R {
    let LIndex = word.index(word.startIndex, offsetBy: L)
    let RIndex = word.index(word.startIndex, offsetBy: R)
    if word[LIndex] != word[RIndex] {
      return false
    }
    L += 1
    R -= 1
  }
  return true
}

// Given a sorted array of integers, return the indices
// of two elements (in different positions) that sum up to
// the target value. Assume there is exactly one solution.
// O(n)
func targetSum(_ nums: [Int], _ target: Int) -> [Int] {
  var L = 0, R = nums.count - 1
  while L < R {
    if nums[L] + nums[R] > target {
      R -= 1
    }
    else if nums[L] + nums[R] < target {
      L += 1
    }
    else {
      return [L, R]
    }
  }
  return [-1]  // Should never reach this point
}