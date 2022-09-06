import java.util.HashSet;

public class SlidingWindowFixedSize {
    
    // Check if array contains a pair of duplicate values,
    // where the two duplicates are no farther than k positions from 
    // eachother (i.e. arr[i] == arr[j] and abs(i - j) + 1 <= k).
    // O(n * k)
    public static boolean closeDuplicatesBruteForce(int[] nums, int k) {
        for (int i = 0; i < nums.length; i++) {
            for (int j = i + 1; j < Math.min(nums.length, i + k); j++) {
                if (nums[i] == nums[j]) {
                    return true;
                }
            }
        }
        return false;
    }

    // Same problem using sliding window.
    // O(n)
    public static boolean closeDuplicates(int[] nums, int k) {
        HashSet<Integer> window = new HashSet<>(); //Cur window of size <= k
        int L = 0;

        for (int i = 0; i < nums.length; i++) {
            if (i - L + 1 > k) {
                window.remove(nums[L]);
                L++;
            }
            if (window.contains(nums[i])) {
                return true;
            }
            window.add(nums[i]);
        }
        return false;
    }
}