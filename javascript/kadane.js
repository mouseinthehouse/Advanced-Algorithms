// Brute Force: O(n^2)
function bruteForce(nums) {
    let maxSum = nums[0];

    for (let i = 0; i < nums.length; i++) { 
        let curSum = 0;
        for (let j = i; j < nums.length; j++) {
            curSum += nums[j];
            maxSum = Math.max(maxSum, curSum);
        }    
    }       
    return maxSum;
}

// Kadane's Algorithm: O(n)
function kadanes(nums) {
    let maxSum = nums[0];
    let curSum = 0;

    for (let n of nums) {
        curSum = Math.max(curSum, 0);
        curSum += n;
        maxSum = Math.max(maxSum, curSum);
    }
    return maxSum;
}

// Return the left and right index of the max subarray sum,
// assuming there's exactly one result (no ties).
// Sliding window variation of Kadane's: O(n)
function slidingWindow(nums) {
    let maxSum = nums[0];
    let curSum = 0;
    let maxL = 0, maxR = 0;
    let L = 0;

    for (let i = 0; i < nums.length; i++) {
        if (curSum < 0) {
            curSum = 0;
            L = i;
        }
        curSum += nums[i];
        if (curSum > maxSum) {
            maxSum = curSum;
            maxL = L; 
            maxR = i;     
        }    
    }    
    return [maxL, maxR];
}    

let nums = [4, -1, 2, -7, -3, 3, 4];
console.log(nums);
console.log(bruteForce(nums));
console.log(kadanes(nums));
console.log(slidingWindow(nums));