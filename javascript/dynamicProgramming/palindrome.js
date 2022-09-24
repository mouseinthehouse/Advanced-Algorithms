// Time: O(n^2), Space: O(n)
function longest(s) {
    let length = 0;

    for (let i = 0; i < s.length; i++) {
        // odd length
        let l = i, r = i;
        while (l >= 0 && r < s.length && s.charAt(l) == s.charAt(r)) {
            if (r - l + 1 > length) {
                length = r - l + 1;
            }
            l--;
            r++;
        }

        // even length
        l = i;
        r = i + 1;
        while (l >= 0 && r < s.length && s.charAt(l) == s.charAt(r)) {
            if (r - l + 1 > length) {
                length = r - l + 1;
            }
            l--;
            r++;
        }
    }
    return length;
}

// Same solution, without duplicate code.
// Time: O(n^2), Space: O(n)
function longest2(s) {
    let length = 0;
    for (let i = 0; i < s.length; i++) {
        // odd length
        length = Math.max(length, helper(s, i, i));
        
        // even length
        length = Math.max(length, helper(s, i, i + 1)); 
    }
    return length;
}

function helper(s, l, r) {
    let maxLength = 0;
    while (l >= 0 && r < s.length && s.charAt(l) == s.charAt(r)) {
        if (r - l + 1 > maxLength) {
            maxLength = r - l + 1;
        }
        l--;
        r++;
    }
    return maxLength;
} 