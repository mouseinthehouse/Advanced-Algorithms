# Time: O(n^2), Space: O(n)
def longest(s):
    length = 0
    
    for i in range(len(s)):
        # odd length
        l, r = i, i
        while l >= 0 and r < len(s) and s[l] == s[r]:
            if (r - l + 1) > length:
                length = r - l + 1
            l -= 1
            r += 1
        
        # even length
        l, r = i, i + 1
        while l >= 0 and r < len(s) and s[l] == s[r]:
            if (r - l + 1) > length:
                length = r - l + 1
            l -= 1
            r += 1
            
    return length


# Same solution, without duplicate code.
# Time: O(n^2), Space: O(n)
def longest(s):
    length = 0
    for i in range(len(s)):
        # odd length
        length = max(length, helper(s, i, i))
        
        # even length
        length = max(length, helper(s, i, i + 1)) 
    return length

def helper(s, l, r):
    maxLength = 0
    while l >= 0 and r < len(s) and s[l] == s[r]:
        if (r - l + 1) > maxLength:
            maxLength = r - l + 1
        l -= 1
        r += 1
    return maxLength