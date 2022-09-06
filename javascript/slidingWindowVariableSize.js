// Find the length of longest subarray with the same 
// value in each position: O(n)
function longestSubarray(nums) {
    let length = 0;
    let L = 0;

    for (let i = 0; i < nums.length; i++) {
        if (nums[L] != nums[i]) {
            L = i;
        }
        length = Math.max(length, i - L + 1);
    }
    return length;
}

// Find length of minimum size subarray where the sum is 
// greater than or equal to the target: O(n)
function shortestSubarray(nums, target) {
    let L = 0, total = 0;
    let length = Infinity;

    for (let i = 0; i < nums.length; i++) {
        total += nums[i];
        while (total >= target) {
            length = Math.min(i - L + 1, length);
            total -= nums[L];
            L++;
        }
    }

    if (length == Infinity) {
        return 0;
    } 
    return length;
}