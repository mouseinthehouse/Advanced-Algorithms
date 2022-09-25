# Given n numbers (1 - n), return all possible combinations
# of size k. (n choose k math problem).
# Time: O(k * 2^n)
# TEST HERE: https://leetcode.com/problems/combinations/
def combinations(n, k):
    combs = []
    helper(1, [], combs, n, k)
    return combs

def helper(i, curComb, combs, n, k):
    if len(curComb) == k:
        combs.append(curComb.copy())
        return
    if i > n:
        return
    
    # decision to include 
    curComb.append(i)
    helper(i + 1, curComb, combs, n, k)
    curComb.pop()
    
    # decision to NOT include i
    helper(i + 1, curComb, combs, n, k)