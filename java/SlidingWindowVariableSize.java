public class SlidingWindowVariableSize {
    
    // Find the length of longest subarray with the same 
    // value in each position: O(n)
    public static int longestSubarray(int[] nums) {
        int length = 0;
        int L = 0;

        for (int i = 0; i < nums.length; i++) {
            if (nums[L] != nums[i]) {
                L = i;
            }
            length = Math.max(length, i - L + 1);
        }
        return length;
    }

    // Find length of minimum size subarray where the sum is 
    // greater than or equal to the target: O(n)
    public static int shortestSubarray(int[] nums, int target) {
        int L = 0, total = 0;
        double length = Double.POSITIVE_INFINITY;

        for (int i = 0; i < nums.length; i++) {
            total += nums[i];
            while (total >= target) {
                length = Math.min(i - L + 1, length);
                total -= nums[L];
                L++;
            }
        }

        if (length ==  Double.POSITIVE_INFINITY) {
            return 0;
        } 
        return (int) length;
    }
}