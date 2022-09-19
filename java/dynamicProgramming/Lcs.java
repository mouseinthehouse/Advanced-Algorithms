public class Lcs {
    
    // Time: O(2^(n + m)), Space: O(n + m)
    public static int dfs(String s1, String s2) {
        return dfsHelper(s1, s2, 0, 0);
    }

    public static int dfsHelper(String s1, String s2, int i1, int i2) {
        if (i1 == s1.length() || i2 == s2.length()) {
            return 0;
        }

        if (s1.charAt(i1) == s2.charAt(i2)) {
            return 1 + dfsHelper(s1, s2, i1 + 1, i2 + 1);
        } else {
            return Math.max(dfsHelper(s1, s2, i1 + 1, i2), 
                             dfsHelper(s1, s2, i1, i2 + 1));
        }
    }

    // Time: O(n * m), Space: O(n + m)
    public static int memoization(String s1, String s2) {
        int N = s1.length(), M = s2.length();
        char[][] cache = new char[N][M];
        return memoHelper(s1, s2, 0, 0, cache);
    }

    public static int memoHelper(String s1, String s2, int i1, int i2, char[][] cache) {
        if (i1 == s1.length() || i2 == s2.length()) {
            return 0;
        }

        if (cache[i1][i2] != '\0') {
            return cache[i1][i2];
        }

        if (s1.charAt(i1) == s2.charAt(i2)) {
            cache[i1][i2] = (char) (1 + memoHelper(s1, s2, i1 + 1, i2 + 1, cache));
        } else {
            cache[i1][i2] = (char) Math.max(memoHelper(s1, s2, i1 + 1, i2, cache), 
                                    memoHelper(s1, s2, i1, i2 + 1, cache));
        }
        return cache[i1][i2];
    }

    // Time: O(n * m), Space: O(n + m)
    public static int dp(String s1, String s2) {
        int N = s1.length(), M = s2.length();
        char[][] dp = new char[N][M];

        for (int i = 0; i < M; i++) {
            if (s1.charAt(0) == s2.charAt(i)) {
                dp[0][i] = 1;
            }
        }
        for (int i = 0; i < N; i++) {
            if (s1.charAt(i) == s2.charAt(0)) {
                dp[i][0] = 1;
            }
        }

        for (int i = 1; i < N; i++) {
            for (int j = 1; j < M; j++) {
                if (s1.charAt(i) == s2.charAt(j)) {
                    dp[i][j] = (char) (1 + dp[i-1][j-1]);
                } else {
                    dp[i][j] = (char) Math.max(dp[i-1][j], 
                                        dp[i][j-1]);
                }
            }
        }
        return dp[N-1][M-1];
    }

    // Time: O(n * m), Space: O(m)
    public static int optimizedDp(String s1, String s2) {
        int N = s1.length(), M = s2.length();
        char[] dp = new char[M + 1];

        for (int i = 0; i < N; i++) {
            char[] curRow = new char[M + 1];
            for (int j = 0; j < M; j++) {
                if (s1.charAt(i) == s2.charAt(j)) {
                    curRow[j+1] = (char) (1 + dp[j]);
                } else {
                    curRow[j+1] = (char) Math.max(dp[j + 1], curRow[j]);
                }
            }
            dp = curRow;
        }
        return dp[M];
    }
}