# TEST CODE HERE, its not exactly the same problem so just see if the result looks correct:
https://leetcode.com/problems/network-delay-time/

# Given a connected graph represented by a list of edges, where
# edge[0] = src, edge[1] = dst, and edge[2] = weight,
# find the shortest path from src to every other node in the 
# graph. There are n nodes in the graph.
# O(E * logV), O(E * logE) is also correct.
def shortestPath(edges, n, src):
    adj = {}
    for i in range(1, n + 1):
        adj[i] = []
        
    # s = src, d = dst, w = weight
    for s, d, w in edges:
        adj[s].append((d, w))

    shortest = {}
    minHeap = [(0, src)]
    visit = set()
    while minHeap:
        w1, n1 = heapq.heappop(minHeap)
        if n1 in visit:
            continue
        shortest[n1] = w1
        visit.add(n1)

        for n2, w2 in adj[n1]:
            if n2 not in visit:
                heapq.heappush(minHeap, (w1 + w2, n2))
    return shortest