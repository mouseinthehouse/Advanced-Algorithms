import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

// Given a list of N items, and a backpack with a
// limited capacity, return the maximum total profit that 
// can be contained in the backpack. The i-th item's profit
// is profit[i] and it's weight is weight[i]. Assume you can
// only add each item to the bag at most one time. 

// Brute force Solution
// Time: O(2^n), Space: O(n)
// Where n is the number of items.

public class ZeroOneKnapsack {
    
    public static int dfs(List<Integer> profit, List<Integer> weight, int capacity) {
        return dfsHelper(0, profit, weight, capacity);
    }

    public static int dfsHelper(int i, List<Integer> profit, List<Integer> weight, int capacity) {
        if (i == profit.size()) {
            return 0;
        }

        // Skip item i
        int maxProfit = dfsHelper(i + 1, profit, weight, capacity);

        // Include item i
        int newCap = capacity - weight.get(i);
        if (newCap >= 0) {
            int p = profit.get(i) + dfsHelper(i + 1, profit, weight, newCap);
            // Compute the max
            maxProfit = Math.max(maxProfit, p);
        }
        return maxProfit;
    }

    // Memoization Solution
    // Time: O(n * m), Space: O(n * m)
    // Where n is the number of items & m is the capacity.
    public static int memoization(List<Integer> profit, List<Integer> weight, int capacity) {
        // A 2d array, with N rows and M + 1 columns, init with -1's
        int N = profit.size(), M = capacity;
        List<Integer[]> cache = new ArrayList<>();
        for (int row = 0; row < N; row++) {
            cache.add(row, new Integer[M + 1]);
            Arrays.fill(cache.get(row), -1);
        }

        return memoHelper(0, profit, weight, capacity, cache);
    }

    public static int memoHelper(int i, List<Integer> profit, List<Integer> weight, 
        int capacity, List<Integer[]> cache) {
        if (i == profit.size()) {
            return 0;
        }
        if (cache.get(i)[capacity] != -1) {
            return cache.get(i)[capacity];
        }

        // Skip item i
        cache.get(i)[capacity] = memoHelper(i + 1, profit, weight, capacity, cache);

        // Include item i
        int newCap = capacity - weight.get(i);
        if (newCap >= 0) {
            int p = profit.get(i) + memoHelper(i + 1, profit, weight, newCap, cache);
            // Compute the max
            cache.get(i)[capacity] = Math.max(cache.get(i)[capacity], p);  
        }
        return cache.get(i)[capacity];
    } 


    // Dynamic Programming Solution
    // Time: O(n * m), Space: O(n * m)
    // Where n is the number of items & m is the capacity.
    public static int dp(List<Integer> profit, List<Integer> weight, int capacity) {
        int N = profit.size(), M = capacity;
        List<Integer[]> dp = new ArrayList<>();
        for (int row = 0; row < N; row++) {
            dp.add(row, new Integer[M + 1]);
            Arrays.fill(dp.get(row), 0);
        }

        // Fill the first column and row to reduce edge cases
        for (int i = 0; i < N; i++) {
            dp.get(i)[0] = 0;
        }
        for (int c = 0; c <= M; c++) {
            if (weight.get(0) <= c) {
                dp.get(0)[c] = profit.get(0);
            } 
        }

        for (int i = 1; i < N; i++) {
            for (int c = 1; c <= M; c++) {
                int skip = dp.get(i-1)[c];
                int include = 0;
                if (c - weight.get(i) >= 0) {
                    include = profit.get(i) + dp.get(i-1)[c - weight.get(i)];
                }
                dp.get(i)[c] = Math.max(include, skip);
            }
        }
        return dp.get(N-1)[M];
    }


    // Memory optimized Dynamic Programming Solution
    // Time: O(n * m), Space: O(m)
    public static int optimizedDp(List<Integer> profit, List<Integer> weight, int capacity) {
        int N = profit.size(), M = capacity;
        Integer[] dp = new Integer[M+1];
        Arrays.fill(dp, 0);

        // Fill the first row to reduce edge cases
        for (int c = 0; c <= M; c++) {
            if (weight.get(0) <= c) {
                dp[c] = profit.get(0);
            } 
        }

        for (int i = 1; i < N; i++) {
            Integer[] curRow = new Integer[M+1];
            Arrays.fill(curRow, 0);
            for (int c = 1; c <= M; c++) {
                int skip = dp[c];
                int include = 0;
                if (c - weight.get(i) >= 0) {
                    include = profit.get(i) + dp[c - weight.get(i)];
                }
                curRow[c] =  Math.max(include, skip);
            }
            dp = curRow;
        }
        return dp[M];
    }
}