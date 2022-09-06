// Check if array contains a pair of duplicate values,
// where the two duplicates are no farther than k positions from 
// eachother (i.e. arr[i] == arr[j] and abs(i - j) + 1 <= k).
// O(n * k)
function closeDuplicatesBruteForce(nums, k) {
    for (let i = 0; i < nums.length; i++) {
        for (let j = i + 1; j < Math.min(nums.length, i + k); j++) {
            if (nums[i] == nums[j]) {
                return true;
            }
        }
    }
    return false;
}

// Same problem using sliding window.
// O(n)
function closeDuplicates(nums, k) {
    let window = new Set();     //Cur window of size <= k
    let L = 0;

    for (let i = 0; i < nums.length; i++) {
        if (i - L + 1 > k) {
            window.delete(nums[L]);
            L++;
        }
        if (window.has(nums[i])) {
            return true;
        }
        window.add(nums[i]);
    }
    return false;
}