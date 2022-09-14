
# Return edges making up the minimum spanning tree.
def minimumSpanningTree(edges):
    adj = {}

    for src, dst, weight in edges:
        if src not in adj:
            adj[src] = []
        if dst not in adj:
            adj[dst] = []
        adj[src].append([dst, weight])

    mst = []
    #TODO: fix the src
    visit = set()
    minHeap [[0, edges[0], edges[1]]]
    while minHeap:
        weight, src, dst = heapq.heappop(minHeap)
        if src in visit:
            continue

        mst.append([src, dst])
        visit.add(src)
        for neighbor, weight in adj[src]:
            if neighbor not in visit:
                heapq.heappush(minHeap, [weight, src, neighbor])

    return mst

edges = [[0, 1, 5], [1, 2, 5], [2, 3, 5], [1, 3, 5]]