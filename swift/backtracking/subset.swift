// Time: O(n * 2^n), Space: O(n)
func subsetsWithoutDuplicates(_ nums: [Int]) -> [[Int]] {
  var curSet: [Int] = []
  var subsets: [[Int]] = []
  helper(0, nums, &curSet, &subsets)
  return subsets
}

func helper(_ i: Int, _ nums: [Int], _ curSet: inout [Int], _ subsets: inout [[Int]]) {
  if i >= nums.count {
    subsets.append(curSet)
    return
  }

  // decision to include nums[i]
  curSet.append(nums[i])
  helper(i + 1, nums, &curSet, &subsets)
  curSet.removeLast()

  // decision NOT to include nums[i]
  helper(i + 1, nums, &curSet, &subsets)
}


// Time: O(n * 2^n), Space: O(n)
func subsetsWithDuplicates(_ nums: [Int]) -> [[Int]] {
  var sortedNums = nums
  sortedNums.sort()
  var curSet: [Int] = []
  var subsets: [[Int]] = []
  helper2(0, nums, &curSet, &subsets)
  return subsets
}

func helper2(_ i: Int, _ nums: [Int], _ curSet: inout [Int], _ subsets: inout [[Int]]) {
  if i >= nums.count {
    subsets.append(curSet)
    return
  }

  // decision to include nums[i]
  curSet.append(nums[i])
  helper2(i + 1, nums, &curSet, &subsets)
  curSet.removeLast()

  // decision NOT to include nums[i]
  var j = i
  while j + 1 < nums.count && nums[j] == nums[j + 1] {
    j += 1
  }
  helper2(j + 1, nums, &curSet, &subsets)
}