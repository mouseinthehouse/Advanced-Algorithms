// Time: O(2^(n + m)), Space: O(n + m)
func dfs(_ s1: String, _ s2: String) -> Int {
  return dfsHelper(s1, s2, 0, 0)
}

func dfsHelper(_ s1: String, _ s2: String, _ i1: Int, _ i2: Int) -> Int {
  if i1 == s1.count || i2 == s2.count {
    return 0
  }

  let i1Index = s1.index(s1.startIndex, offsetBy: i1)
  let i2Index = s2.index(s2.startIndex, offsetBy: i2)
  if s1[i1Index] == s2[i2Index] {
    return 1 + dfsHelper(s1, s2, i1 + 1, i2 + 1)
  }
  else {
    return max(dfsHelper(s1, s2, i1 + 1, i2), 
               dfsHelper(s1, s2, i1, i2 + 1))
  }
}


// Time: O(n * m), Space: O(n + m)
func memoization(_ s1: String, _ s2: String) -> Int {
  let N = s1.count, M = s2.count
  var cache = Array(repeating: Array(repeating: -1, count: M), count: N)
  return memoHelper(s1, s2, 0, 0, &cache)
}

func memoHelper(_ s1: String, _ s2: String, _ i1: Int, _ i2: Int, _ cache: inout [[Int]]) -> Int {
  if i1 == s1.count || i2 == s2.count {
    return 0
  }
  if cache[i1][i2] != -1 {
    return cache[i1][i2]
  }

  let i1Index = s1.index(s1.startIndex, offsetBy: i1)
  let i2Index = s2.index(s2.startIndex, offsetBy: i2)
  if s1[i1Index] == s2[i2Index] {
    cache[i1][i2] = 1 + memoHelper(s1, s2, i1 + 1, i2 + 1, &cache)
  }
  else {
    cache[i1][i2] = max(memoHelper(s1, s2, i1 + 1, i2, &cache), 
                       memoHelper(s1, s2, i1, i2 + 1, &cache))
  }
  return cache[i1][i2]
}


// Time: O(n * m), Space: O(n + m)
func dp(_ s1: String, _ s2: String) -> Int {
  let N = s1.count, M = s2.count
  var dp = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)

  for i in 0..<N {
    for j in 0..<M {
      let iIndex = s1.index(s1.startIndex, offsetBy: i)
      let jIndex = s2.index(s2.startIndex, offsetBy: j)
      if s1[iIndex] == s2[jIndex] {
        dp[i + 1][j + 1] = 1 + dp[i][j]
      }
      else {
        dp[i + 1][j + 1] = max(dp[i][j + 1], dp[i + 1][j])
      }
    }
  }
  return dp[N][M]
}


// Time: O(n * m), Space: O(m)
func optimizedDp(_ s1: String, _ s2: String) -> Int {
  let N = s1.count, M = s2.count
  var dp = Array(repeating: 0, count: M + 1)

  for i in 0..<N {
    var curRow = Array(repeating: 0, count: M + 1)
    for j in 0..<M {
      let iIndex = s1.index(s1.startIndex, offsetBy: i)
      let jIndex = s2.index(s2.startIndex, offsetBy: j)
      if s1[iIndex] == s2[jIndex] {
        curRow[j + 1] = 1 + dp[j]
      }
      else {
        curRow[j + 1] = max(dp[j + 1], curRow[j])
      }
    }
    dp = curRow
  }
  return dp[M]
}