#include <vector>

using std::vector;

// Time: O(n^2 * n!)
vector<vector<int>> permutationsRecursive(vector<int>& nums) {
    return helper(0, nums);
}

vector<vector<int>> helper(int i, vector<int>& nums) {
    if (i == nums.size()) {
        return {{}};
    }
    vector<vector<int>> resPerms;
    vector<vector<int>> perms = helper(i + 1, nums);
    for (vector<int> p : perms) {
        for (int j = 0; j < p.size() + 1; j++) {
            vector<int> pCopy(p);
            pCopy.insert(pCopy.begin() + j, nums[i]);
            resPerms.push_back(pCopy);
        }
    }
    return resPerms;
}


// Time: O(n^2 * n!)
vector<vector<int>> permutationsIterative(vector<int>& nums) {
    vector<vector<int>> perms = {{}};
        
    for (int n : nums) {
        vector<vector<int>> nextPerms;
        for (vector<int> p : perms) {
            for (int i = 0; i < p.size() + 1; i++) {
                vector<int> pCopy(p);
                pCopy.insert(pCopy.begin() + i, n);
                nextPerms.push_back(pCopy);
            }
        }
        perms = nextPerms;
    }
    return perms;
}
