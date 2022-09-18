// Given a list of N items, and a backpack with a
// limited capacity, return the maximum total profit that 
// can be contained in the backpack. The i-th item's profit
// is profit[i] and it's weight is weight[i]. Assume you can
// only add each item to the bag at most one time. 

// Brute force Solution
// Time: O(2^n), Space: O(n)
// Where n is the number of items.
function dfs( profit,  weight, capacity) {
    return dfsHelper(0, profit, weight, capacity);
}

function dfsHelper(i, profit, weight, capacity) {
    if (i == profit.length) {
        return 0;
    }

    // Skip item i
    let maxProfit = dfsHelper(i + 1, profit, weight, capacity);

    // Include item i
    let newCap = capacity - weight[i];
    if (newCap >= 0) {
        let p = profit[i] + dfsHelper(i, profit, weight, newCap);
        // Compute the max
        maxProfit = Math.max(maxProfit, p);
    }
    return maxProfit;
}

// Memoization Solution
// Time: O(n * m), Space: O(n * m)
// Where n is the number of items & m is the capacity.
function memoization(profit, weight, capacity) {
    // A 2d array, with N rows and M + 1 columns, init with -1's
    let N = profit.length, M = capacity;
    let cache = new Array()
    for (let row = 0; row < N; row++) {
        cache.push(new Array(M + 1).fill(-1));
    }
    return memoHelper(0, profit, weight, capacity, cache);
}

function memoHelper(i, profit, weight, capacity, cache) {
    if (i == profit.length) {
        return 0;
    }
    if (cache[i][capacity] != -1) {
        return cache[i][capacity];
    }
    
    // Skip item i
    cache[i][capacity] = memoHelper(i + 1, profit, weight, capacity, cache);

    // Include item i
    let newCap = capacity - weight[i];
    if (newCap >= 0) {
        let p = profit[i] + memoHelper(i, profit, weight, newCap, cache);
        // Compute the max
        cache[i][capacity] = Math.max(cache[i][capacity], p);  
    }
    
    return cache[i][capacity];
} 

// Dynamic Programming Solution
// Time: O(n * m), Space: O(n * m)
// Where n is the number of items & m is the capacity.
function dp(profit, weight, capacity) {
    let N = profit.length, M = capacity;
    let dp = new Array();
    for (let row = 0; row < N; row++) {
        dp.push(new Array(M + 1).fill(0));
    }
    

    // Fill the first column and row to reduce edge cases
    for (let i = 0; i < N; i++) {
        dp[i][0] = 0;
    }
    for (let c = 0; c <= M; c++) {
        if (weight[0] <= c) {
            dp[0][c] = (Math.floor(c / weight[0])) * profit[0];
        } 
    }

    for (let i = 1; i < N; i++) {
        for (let c = 1; c <= M; c++) {
            let skip = dp[i-1][c];
            let include = 0;
            if (c - weight[i] >= 0) {
                include = profit[i] + dp[i][c - weight[i]];
            }
            dp[i][c] = Math.max(include, skip);
        }
    }
    return dp[N-1][M];
}

// Memory optimized Dynamic Programming Solution
// Time: O(n * m), Space: O(m)
function optimizedDp(profit, weight, capacity) {
    let N = profit.length, M = capacity;
    let dp = new Array(M+1).fill(0);

    for (let i = 1; i < N; i++) {
        let curRow = new Array(M+1).fill(0);
        for (let c = 1; c <= M; c++) {
            let skip = dp[c];
            let include = 0;
            if (c - weight[i] >= 0) {
                include = profit[i] + curRow[c - weight[i]];
            }
            curRow[c] =  Math.max(include, skip);
        }
        dp = curRow;
    }
    return dp[M];
}
p = [4, 4, 7, 1]
w = [5, 2, 3, 1]
c = 8
console.log(dfs(p, w, c))
console.log(memoization(p, w, c))
console.log(dp(p, w, c))
console.log(optimizedDp(p, w, c))