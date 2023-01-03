// Given n numbers (1 - n), return all possible combinations
// of size k. (n choose k math problem).
// Time: O(k * 2^n)
func combinations(_ n: Int, _ k: Int) -> [[Int]] {
  var combs: [[Int]] = []
  var curCombs: [Int] = []
  helper(1, &curCombs, &combs, n, k)
  return combs
}

func helper(_ i: Int, _ curComb: inout [Int], _ combs: inout [[Int]], _ n: Int, _ k: Int) {
  if curComb.count == k {
    combs.append(curComb)
    return
  }
  if i > n {
    return
  }

  // decision to include i
  curComb.append(i)
  helper(i + 1, &curComb, &combs, n, k)
  curComb.removeLast()

  // decision to NOT include i
  helper(i + 1, &curComb, &combs, n, k)
}


// Time: O(k * C(n, k))
func combinations2(_ n: Int, _ k: Int) -> [[Int]] {
  var combs: [[Int]] = []
  var curCombs: [Int] = []
  helper2(1, &curCombs, &combs, n, k)
  return combs
}

func helper2(_ i: Int, _ curComb: inout [Int], _ combs: inout [[Int]], _ n: Int, _ k: Int) {
  if curComb.count == k {
    combs.append(curComb)
    return
  }
  if i > n {
    return
  }

  for j in i..<n + 1 {
    curComb.append(j)
    helper2(j + 1, &curComb, &combs, n, k)
    curComb.removeLast()
  }
}

