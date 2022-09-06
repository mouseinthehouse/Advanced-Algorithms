#include <vector>
#include <unordered_set>
#include <algorithm>
#include <iostream>

using std::vector;
using std::unordered_set;
using std::min;

// Check if array contains a pair of duplicate values,
// where the two duplicates are no farther than k positions from 
// eachother (i.e. arr[i] == arr[j] and abs(i - j) + 1 <= k).
// O(n * k)
bool closeDuplicatesBruteForce(vector<int>& nums, int k) {
    int size = static_cast<int>(nums.size());
    for (int L = 0; L < size; L++) {
        for (int R = L + 1; R < min(size, R + k); R++) {
            if (nums[L] == nums[R]) {
                return true;
            }
        }
    }
    return false;
}

// Same problem using sliding window.
// O(n)
bool closeDuplicates(vector<int>& nums, int k) {
    unordered_set<int> window; // Cur window of size <= k
    int L = 0;

    for (int R = 0; R < nums.size(); R++) {
        if (R - L + 1 > k) {
            window.erase(nums[L]);
            L++;
        }
        if (window.count(nums[R]) > 0) {
            return true;
        }
        window.insert(nums[R]);
    }
    return false;
}

int main() {
    vector<int> nums = {2, -1, 4, -7, 4, 3};

// std::cout << bruteForce(nums) << std::endl;
//     std::cout << kadanes(nums) << std::endl;
    
//     for (int n : slidingWindow(nums)) {
//         std::cout << n << std::endl;
//     }
//     return 0;

}