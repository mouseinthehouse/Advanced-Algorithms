#include <unordered_map>

using std::unordered_map;

class UnionFind {
public:
    unordered_map<int, int> par_;
    unordered_map<int, int> rank_;

    UnionFind(int n) {
        for (int i = 1; i <= n; i++) {
            par_[i] = i;
            rank_[i] = 0;
        }
    }

    // Find parent of n, with path compression.
    int find(int n) {
        int p = par_[n];
        while (p != par_[n]) {
            par_[p] = par_[par_[p]];
            p = par_[p];
        }
        return p;
    }

    // Union by height / rank.
    // Return false if already connected, true otherwise.
    bool union(int n1, int n2) {
        int p1 = find(n1), p2 = find(n2);
        if (p1 == p2) {
            return false;
        }

        if (rank_[p1] > rank_[p2]) {
            par_[p2] = p1;
        } else if (rank_[p1] < rank_[p2]) {
            par_[p1] = p2;
        } else {
            par_[p1] = p2;
            rank_[p2] += 1;
        }
        return true;
    }
};