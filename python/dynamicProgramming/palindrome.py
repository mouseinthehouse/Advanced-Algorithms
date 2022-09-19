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

