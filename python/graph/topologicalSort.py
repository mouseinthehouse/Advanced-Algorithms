# Course schedule ii is easier than normal topological sort
# Graph not necessarily connected

# Given a directed acyclical graph, return a valid
# topological ordering of the graph. 
def topologicalSort(edges, n):
    adj = {}
    for i in range(1, n + 1):
        adj[i] = []
    for src, dst in edges:
        adj[src].append(dst)

    topSort = []
    visit = set()
    for i in range(1, n + 1):
        dfs(i, adj, visit, topSort)
    topSort.reverse()
    return topSort

def dfs(src, adj, visit, topSort):
    if src in visit:
        return True
    visit.add(src)
    
    for neighbor in adj[src]:
        dfs(neighbor, adj, visit, topSort)
    topSort.append(src)

edges = [[1,2],[1,3],[2,4],[3,4],[5,6],[6,4],[6,8],[7,8]]
print(topologicalSort(edges, 8))