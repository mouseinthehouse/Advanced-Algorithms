// Time: O(2^(n + m)), Space: O(n + m)
function dfs(s1, s2) {
    return dfsHelper(s1, s2, 0, 0);
}

function dfsHelper(s1, s2, i1, i2) {
    if (i1 == s1.length || i2 == s2.length) {
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
function memoization(s1, s2) {
    const N = s1.length, M = s2.length;
    let cache = new Array(N).fill(new Array(M).fill(-1)); 
    return memoHelper(s1, s2, 0, 0, cache);
}

function memoHelper(s1, s2, i1, i2, cache) {
    if (i1 == s1.length || i2 == s2.length) {
        return 0;
    }

    if (cache[i1][i2] != -1) {
        return cache[i1][i2];
    }

    if (s1.charAt(i1) == s2.charAt(i2)) {
        cache[i1][i2] =  1 + memoHelper(s1, s2, i1 + 1, i2 + 1, cache);
    } else {
        cache[i1][i2] =  Math.max(memoHelper(s1, s2, i1 + 1, i2, cache), 
                                memoHelper(s1, s2, i1, i2 + 1, cache));
    }
    return cache[i1][i2];
}

// Time: O(n * m), Space: O(n + m)
function dp(s1, s2) {
    const N = s1.length, M = s2.length;
    let dp = new Array(N+1).fill(new Array(M+1).fill(0));;

    for (let i = 0; i < N; i++) {
        for (let j = 0; j < M; j++) {
            if (s1.charAt(i) == s2.charAt(j)) {
                dp[i+1][j+1] =  1 + dp[i][j];
            } else {
                dp[i+1][j+1] =  Math.max(dp[i][j+1], dp[i+1][j]);
            }
        }
    }
    return dp[N][M];
}

// Time: O(n * m), Space: O(m)
function optimizedDp(s1, s2) {
    const N = s1.length, M = s2.length;
    let dp = new Array(M + 1).fill(0);

    for (let i = 0; i < N; i++) {
        let curRow = new Array(M + 1).fill(0);
        for (let j = 0; j < M; j++) {
            if (s1.charAt(i) == s2.charAt(j)) {
                curRow[j+1] = 1 + dp[j];
            } else {
                curRow[j+1] = Math.max(dp[j + 1], curRow[j]);
            }
        }
        dp = curRow;
    }
    return dp[M];
}