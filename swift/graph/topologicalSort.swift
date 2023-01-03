// Given a directed acyclical graph, return a valid
// topological ordering of the graph. 
func topologicalSort(_ edges: [[Int]], _ n: Int) -> [Int] {
  var adj = [Int: [Int]]()
  for i in 1..<n + 1{
    adj[i] = []
  }
  for edge in edges {
    let src = edge[0], dst = edge[1]
    adj[src]!.append(dst)
  }
  
  var topSort: [Int] = []
  var visit: Set<Int> = []
  for i in 1..<n + 1 {
    dfs(i, adj, &visit, &topSort)
  }
  topSort.reverse()
  return topSort
}

func dfs(_ src: Int, _ adj: [Int: [Int]], _ visit: inout Set<Int>, _ topSort: inout [Int]) {
  if visit.contains(src) {
    return
  }
  visit.insert(src)

  for neighbor in adj[src]! {
    dfs(neighbor, adj, &visit, &topSort)
  }
  topSort.append(src)
}