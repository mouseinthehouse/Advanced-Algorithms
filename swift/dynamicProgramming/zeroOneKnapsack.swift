// Given a list of N items, and a backpack with a
// limited capacity, return the maximum total profit that 
// can be contained in the backpack. The i-th item's profit
// is profit[i] and it's weight is weight[i]. Assume you can
// only add each item to the bag at most one time. 

// Brute force Solution
// Time: O(2^n), Space: O(n)
// Where n is the number of items.
func dfs(_ profit: [Int], _ weight: [Int], _ capacity: Int) -> Int {
  return dfsHelper(0, profit, weight, capacity)
}

func dfsHelper(_ i: Int, _ profit: [Int], _ weight: [Int], _ capacity: Int) -> Int {
  if i == profit.count {
    return 0
  }

  // Skip item i
  var maxProfit = dfsHelper(i + 1, profit, weight, capacity)

  // Include item i
  let newCap = capacity - weight[i]
  if newCap >= 0 {
    let p = profit[i] + dfsHelper(i + 1, profit, weight, newCap)
    // Compute the max
    maxProfit = max(maxProfit, p)
  }
  
  return maxProfit
}


// Memoization Solution
// Time: O(n * m), Space: O(n * m)
// Where n is the number of items & m is the capacity.
func memoization(_ profit: [Int], _ weight: [Int], _ capacity: Int) -> Int {
  // A 2d array, with N rows and M + 1 columns, init with -1's
  let N = profit.count, M = capacity
  var cache = Array(repeating: Array(repeating: -1, count: M + 1), count: N)
  return memoHelper(0, profit, weight, capacity, &cache)
}

func memoHelper(_ i: Int, _ profit: [Int], _ weight: [Int], _ capacity: Int, _ cache: inout [[Int]]) -> Int {
  if i == profit.count {
    return 0
  }
  if cache[i][capacity] != -1 {
    return cache[i][capacity]
  }

  // Skip item i
  cache[i][capacity] = memoHelper(i + 1, profit, weight, capacity, &cache)

  // Include item i
  let newCap = capacity - weight[i]
  if newCap >= 0 {
    let p = profit[i] + memoHelper(i + 1, profit, weight, newCap, &cache)
    // Compute the max
    cache[i][capacity] = max(cache[i][capacity], p)
  }
  
  return cache[i][capacity]
}


// Dynamic Programming Solution
// Time: O(n * m), Space: O(n * m)
// Where n is the number of items & m is the capacity.
func dp(_ profit: [Int], _ weight: [Int], _ capacity: Int) -> Int {
  let N = profit.count, M = capacity
  var dp = Array(repeating: Array(repeating: 0, count: M + 1), count: N)

  // Fill the first column and row to reduce edge cases
  for i in 0..<N {
    dp[i][0] = 0
  }
  for c in 0..<M + 1 {
    if weight[0] <= c {
      dp[0][c] = profit[0] 
    }
  }

  for i in 1..<N {
    for c in 1..<M + 1 {
      let skip = dp[i - 1][c]
      var include = 0
      if c - weight[i] >= 0 {
        include = profit[i] + dp[i - 1][c - weight[i]]
      }
      dp[i][c] = max(include, skip)
    }
  }
  return dp[N - 1][M]
}


// Memory optimized Dynamic Programming Solution
// Time: O(n * m), Space: O(m)
func optimizedDp(_ profit: [Int], _ weight: [Int], _ capacity: Int) -> Int {
  let N = profit.count, M = capacity
  var dp = Array(repeating: 0, count: M + 1)

  // Fill the first row to reduce edge cases
  for c in 0..<M + 1 {
    if weight[0] <= c {
      dp[c] = profit[0] 
    }
  }

  for i in 1..<N {
    var curRow = Array(repeating: 0, count: M + 1)
    for c in 1..<M + 1 {
      let skip = dp[c]
      var include = 0
      if c - weight[i] >= 0 {
        include = profit[i] + dp[c - weight[i]]
      }
      curRow[c] = max(include, skip)
    }
    dp = curRow
  }
  return dp[M]
}