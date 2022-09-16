#include <vector>
#include <unordered_map>
#include <utility>
#include <queue>

using std::vector;
using std::unordered_map;
using std::pair;
using std::tuple;
using std::get;
using std::make_tuple;
using std::make_pair;
using std::priority_queue;
using std::greater;

/* UnionFind implementation */
/* class UnionFind {
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
}; */

// Given a list of edges of a connected undirected graph,
// with nodes numbered from 1 to n,
// return a list edges making up the minimum spanning tree.
vector<pair<int, int>> mst(vector<vector<int>>& edges, int n) {
    unordered_map<int, vector<pair<int, int>>> adj;
    for (int i = 1; i < n + 1; i++) {
        adj[i] = vector<pair<int, int>>();
    }
    for (vector<int> edge : edges) {
        int n1 = edge[0], n2 = edge[1], weight = edge[2];
        adj[n1].push_back(make_pair(n2, weight));
        adj[n2].push_back(make_pair(n1, weight));
    }

    priority_queue<tuple<int,int, int>, vector<tuple<int,int, int>>, greater<tuple<int, int, int>>> minHeap; 
    for (vector<int> edge : edges) {
        int n1 = edge[0], n2 = edge[1], weight = edge[2];
        minHeap.push({weight, n1, n2});
    }
    
    UnionFind unionFind(n);
    vector<pair<int, int>> mst;
    while (mst.size() < n - 1) {
        tuple<int, int, int> cur = minHeap.top();
        minHeap.pop();
        int w1 = get<0>(cur), n1 = get<1>(cur), n2 = get<2>(cur);

        if (!unionFind.union(n1, n2)) {
            continue;
        }
        mst.push_back({n1, n2});
    }
    return mst;
}