#include <vector>
#include <unordered_map>
#include <unordered_set>
#include <algorithm>
#include <iostream>

using std::vector;
using std::unordered_map;
using std::unordered_set;
using std::reverse;
using std::cout;
using std::endl;

// Given a directed acyclical graph, return a valid
// topological ordering of the graph. 
vector<int> topologicalSort(vector<vector<int>>& edges, int n) {
    unordered_map<int, vector<int>> adj;
    for (int i = 1; i < n + 1; i++) {
        adj[i] = vector<int>();
    }
    for (vector<int> edge : edges) {
        int n1 = edge[0], n2 = edge[1];
        adj[n1].push_back(n2);
    }
    vector<int> topSort;
    unordered_set<int> visit;
    for (int i = 1; i < n + 1; i++) {
        dfs(i, adj, visit, topSort);
    }
    reverse(topSort.begin(), topSort.end());
    return topSort;
}

void dfs(int src, unordered_map<int, vector<int>>& adj,
    unordered_set<int>& visit, vector<int>& topSort) {
    if (visit.count(src) > 0) {
        return;
    }
    visit.insert(src);

    for (int neighbor : adj[src]) {
        dfs(neighbor, adj, visit, topSort);
    }
    topSort.push_back(src);
}

int main() {
    vector<vector<int>> edges = {{1,2},{1,3},{2,4},{3,4},{5,6},{6,4},{6,8},{7,8}};
    vector<int> s = topologicalSort(edges, 8);
    for (int n : s) {
        cout << n << endl;
    }
    return 0;
}