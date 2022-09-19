# Time: O(2^(n + m)), Space: O(n + m)
def dfs(s1, s2):
    return dfsHelper(s1, s2, 0, 0)

def dfsHelper(s1, s2, i1, i2):
    if i1 == len(s1) or i2 == len(s2):
        return 0
    
    if s1[i1] == s2[i2]:
        return 1 + dfsHelper(s1, s2, i1 + 1, i2 + 1)
    else:
        return max(dfsHelper(s1, s2, i1 + 1, i2),
                dfsHelper(s1, s2, i1, i2 + 1))


# Time: O(n * m), Space: O(n + m)
def memoization(s1, s2):
    N, M = len(s1), len(s2)
    cache = [[-1] * M for _ in range(N)]
    return memoHelper(s1, s2, 0, 0, cache)

def memoHelper(s1, s2, i1, i2, cache):
    if i1 == len(s1) or i2 == len(s2):
        return 0
    if cache[i1][i2] != -1:
        return cache[i1][i2]

    if s1[i1] == s2[i2]:
        cache[i1][i2] = 1 + memoHelper(s1, s2, i1 + 1, i2 + 1, cache)
    else:
        cache[i1][i2] = max(memoHelper(s1, s2, i1 + 1, i2, cache),
                memoHelper(s1, s2, i1, i2 + 1, cache))
    return cache[i1][i2]


# Time: O(n * m), Space: O(n + m)
def dp(s1, s2):
    N, M = len(s1), len(s2)
    dp = [[0] * M for _ in range(N)]

    for i in range(M):
        if s1[0] == s2[i]:
            dp[0][i] = 1
    for i in range(N):
        if s1[i] == s2[0]:
            dp[i][0] = 1
    
    for i in range(1, N):
        for j in range(1, M):
            if s1[i] == s2[j]:
                dp[i][j] = 1 + dp[i-1][j-1]
            else:
                dp[i][j] = max(dp[i-1][j], dp[i][j-1])
    return dp[N-1][M-1]


# Time: O(n * m), Space: O(m)
def optimizedDp(s1, s2):
    N, M = len(s1), len(s2)
    dp = [0] * (M + 1)

    for i in range(N):
        curRow = [0] * (M + 1)
        for j in range(M):
            if s1[i] == s2[j]:
                curRow[j+1] = 1 + dp[j]
            else:
                curRow[j+1] = max(dp[j + 1], curRow[j])
        dp = curRow
    return dp[M]


# Result should be 2 for these three
print(dfs("abc", "adaecb"))
print(memoization("abc", "adaecb"))
print(dp("abc", "adaecb"))
# Result should be 3 for this
print(optimizedDp("abcrex", "adaecbtuve"))