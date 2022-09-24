public class Palindrome {
    
    // Time: O(n^2), Space: O(n)
    public static int longest(String s) {
        int length = 0;

        for (int i = 0; i < s.length(); i++) {
            // odd length
            int l = i, r = i;
            while (l >= 0 && r < s.length() && s.charAt(l) == s.charAt(r)) {
                if (r - l + 1 > length) {
                    length = r - l + 1;
                }
                l--;
                r++;
            }

            // even length
            l = i;
            r = i + 1;
            while (l >= 0 && r < s.length() && s.charAt(l) == s.charAt(r)) {
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
    public static int longest2(String s) {
        int length = 0;
        for (int i = 0; i < s.length(); i++) {
            // odd length
            length = Math.max(length, helper(s, i, i));
            
            // even length
            length = Math.max(length, helper(s, i, i + 1)); 
        }
        return length;
    }

    public static int helper(String s, int l, int r) {
        int maxLength = 0;
        while (l >= 0 && r < s.length() && s.charAt(l) == s.charAt(r)) {
            if (r - l + 1 > maxLength) {
                maxLength = r - l + 1;
            }
            l--;
            r++;
        }
        return maxLength;
    } 
}