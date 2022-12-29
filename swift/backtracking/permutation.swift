// Time: O(n^2 * n!)
func permutationsRecursive(_ nums: [Int]) -> [[Int]] {
  return helper(0, nums)
}

func helper(_ i: Int, _ nums: [Int]) -> [[Int]] {
  if i == nums.count {
    return [[]]
  }

  var resPerms: [[Int]] = []
  let perms = helper(i + 1, nums)
  for p in perms {
    for j in 0..<p.count + 1 {
      var pCopy = p
      pCopy.insert(nums[i], at: j)
      resPerms.append(pCopy)
    }
  }
  return resPerms
}


// Time: O(n^2 * n!)
func permutationsIterative(_ nums: [Int]) -> [[Int]] {
  var perms: [[Int]] = [[]]

  for n in nums {
    var nextPerms: [[Int]] = []
    for p in perms {
      for i in 0..<p.count + 1 {
        var pCopy = p
        pCopy.insert(n, at: i)
        nextPerms.append(pCopy)
      }
    }
    perms = nextPerms
  }
  return perms
}