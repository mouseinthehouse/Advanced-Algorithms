#include <vector>
#include <string>
#include <algorithm>

using std::vector;
using std::max;
using std::string;


// Time: O(2^(n + m)), Space: O(n + m)
int dfsHelper(string& s1, string& s2, int i1, int i2) {
    if (i1 == s1.size() || i2 == s2.size()) {
        return 0;
    }

    if (s1[i1] == s2[i2]) {
        return 1 + dfsHelper(s1, s2, i1 + 1, i2 + 1);
    } else {
        return max(dfsHelper(s1, s2, i1 + 1, i2 + 1),
            dfsHelper(s1, s2, i1, i2 + 1));
    }
} 

int dfs(string& s1, string& s2) {
    return dfsHelper(s1, s2, 0, 0);
}


// Time: O(n * m), Space: O(n * m)
int memoHelper(string& s1, string& s2, int i1, int i2, vector<vector<int>>& cache) {
    if (i1 == s1.size() || i2 == s2.size()) {
        return 0;
    }
    if (cache[i1][i2] != -1) {
        return cache[i1][i2];
    }

    if (s1[i1] == s2[i2]) {
        cache[i1][i2] = 1 + dfsHelper(s1, s2, i1 + 1, i2 + 1);
    } else {
        cache[i1][i2] = max(dfsHelper(s1, s2, i1 + 1, i2 + 1),
            dfsHelper(s1, s2, i1, i2 + 1));
    }
    return cache[i1][i2];
} 

int memoization(string& s1, string& s2) {
    // A 2d array, with N rows and M columns, init with -1's
    int N = s1.size(), M = s2.size();
    vector<vector<int>> cache(N, vector<int>(M, -1));
    return memoHelper(s1, s2, 0, 0, cache);
}


// Time: O(n * m), Space: O(n * m)
int dp(string& s1, string& s2) {
    int N = s1.size(), M = s2.size();
    vector<vector<int>> dp(N + 1, vector<int>(M + 1, 0));

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < M; j++) {
            if (s1[i] == s2[j]) {
                dp[i+1][j+1] = 1 + dp[i][j];
            } else {
                dp[i+1][j+1] = max(dp[i][j+1], dp[i+1][j]);
            }
        }
    }
    return dp[N][M];
}


// Time: O(n * m), Space: O(m)
int optimizedDp(string& s1, string& s2) {
    int N = s1.size(), M = s2.size();
    vector<int> dp(M + 1, 0);

    for (int i = 0; i < N; i++) {
        vector<int> curRow(M + 1, 0);
        for (int j = 0; j < M; j++) {
            if (s1[i] == s2[j]) {
                curRow[j+1] = 1 + dp[j];
            } else {
                curRow[j+1] = max(dp[j + 1], curRow[j]);
            }
        }
        dp = curRow;
    }
    return dp[M];
}
