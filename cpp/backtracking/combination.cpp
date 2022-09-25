#include <vector>

using std::vector;

vector<vector<int>> combinations(int n, int k) {
    vector<vector<int>> combs;
    vector<int> curCombs;
    helper(1, curCombs, combs, n, k);
    return combs;
}

void helper(int i, vector<int>& curComb, vector<vector<int>>& combs, int n, int k) {
    if (curComb.size() == k) {
        combs.push_back(vector<int>(curComb));
        return;
    }
    if (i > n) return;

    // decision to include i
    curComb.push_back(i);
    helper(i + 1, curComb, combs, n, k);
    curComb.pop_back();

    // decision to NOT include i
    helper(i + 1, curComb, combs, n, k);
}


// Time: O(k * C(n, k))
vector<vector<int>> combinations2(int n, int k) {
    vector<vector<int>> combs;
    vector<int> curCombs;
    helper2(1, curCombs, combs, n, k);
    return combs;
}

void helper2(int i, vector<int>& curComb, vector<vector<int>>& combs, int n, int k) {
    if (curComb.size() == k) {
        combs.push_back(vector<int>(curComb));
        return;
    }
    if (i > n) return;

    for (int j = i; j < n + 1; j++) {
        curComb.push_back(j);
        helper2(j + 1, curComb, combs, n, k);
        curComb.pop_back();
    }
}
