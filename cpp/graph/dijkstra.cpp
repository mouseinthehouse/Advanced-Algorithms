#include <vector>
#include <unordered_map>
#include <utility>
#include <queue>

using std::vector;
using std::unordered_map;
using std::pair;
using std::make_pair;
using std::priority_queue;
using std::greater;

unordered_map<int, int> shortestPath(vector<vector<int>>& edges, int n, int src) {
    unordered_map<int, vector<pair<int, int>>> adj;
    for (int i = 1; i < n + 1; i++) {
        adj[i] = vector<pair<int, int>>();
    }
    for (vector<int> edge : edges) {
        // s = src, d = dst, w = weight
        int s = edge[0], d = edge[1], w = edge[2];
        adj[s].push_back(make_pair(d, w));
    }

    unordered_map<int, int> shortest;
    priority_queue<pair<int,int>, vector<pair<int,int>>, greater<pair<int, int>>> minHeap; 
    minHeap.push({0, src});
    while (!minHeap.empty()) {
        pair<int, int> p = minHeap.top();
        minHeap.pop();
        int w1 = p.first, n1 = p.second;

        if (shortest.count(n1) > 0) {
            continue;
        }
        shortest[n1] = w1;
        for (pair<int, int> p : adj[n1]) {
            int n2 = p.first, w2 = p.second;
            if (shortest.count(n2) == 0) {
                minHeap.push({w1 + w2, n2});
            }
        }
    }
    return shortest;
}
