class UnionFind {
  var par = [Int: Int]()
  var rank = [Int: Int]()

  init(_ n: Int) {
    for i in 1..<n + 1 {
      par[i] = i
      rank[i] = 0
    }
  }

  // Find parent of n, with path compression.
  func find(_ n: Int) -> Int {
    var p = par[n]!
    while p != par[p] {
      par[p] = par[par[p]!]
      p = par[p]!
    }
    return p
  }

  // Union by height / rank.
  // Return false if already connected, true otherwise.
  func union(_ n1: Int, _ n2: Int) -> Bool {
    let p1 = find(n1), p2 = find(n2)
    if p1 == p2 {
      return false
    }

    if rank[p1]! > rank[p2]! {
      par[p2] = p1
    }
    else if rank[p1]! < rank[p2]! {
      par[p1] = p2
    }
    else {
      par[p1] = p2
      rank[p2]! += 1
    }
    return true
  }
}

// Swift does not have a built-in heap.
// Min heap
class Heap {
  var heap: [[Int]] = [[Int.min, Int.min, Int.min]]

  func push(_ val: [Int]) {
    heap.append(val)
    var i = heap.count - 1

    // Percolate up
    while i > 1 && heap[i][0] < heap[i / 2][0] {
      let tmp = heap[i]
      heap[i] = heap[i / 2]
      heap[i / 2] = tmp
      i = i / 2
    }
  }

  func pop() -> [Int] {
    if isEmpty() {
      // Normally we would throw an exception if heap is empty.
      return [Int.min, Int.min, Int.min]
    }
    if heap.count == 2 {
      return heap.removeLast()
    }

    let res = heap[1]
    // Move last value to root
    heap[1] = heap.removeLast()
    var i = 1
    // Percolate down
    while 2 * i < heap.count {
      if (2 * i + 1 < heap.count && 
          heap[2 * i + 1][0] < heap[2 * i][0] && 
          heap[i][0] > heap[2 * i + 1][0]) {
        // Swap right child 
        let tmp = heap[i]
        heap[i] = heap[2 * i + 1]
        heap[2 * i + 1] = tmp
        i = 2 * i + 1
      }
      else if heap[i][0] > heap[2 * i][0] {
        // Swap left child
        let tmp = heap[i]
        heap[i] = heap[2 * i]
        heap[2 * i] = tmp
        i = 2 * i
      }
      else {
        break
      }
    }
    return res
  }

  func count() -> Int {
    return heap.count - 1
  }
  
  func isEmpty() -> Bool {
    return heap.count == 1
  }
}

// Given an list of edges of a connected undirected graph,
// with nodes numbered from 1 to n,
// return a list edges making up the minimum spanning tree.
func minimumSpanningTree(_ edges: [[Int]], _ n: Int) -> [[Int]] {
  // add heap stuff here
  let minHeap = Heap()
  for edge in edges {
    let n1 = edge[0], n2 = edge[1], weight = edge[2]
    minHeap.push([weight, n1, n2]) 
  }
  
  let unionFind = UnionFind(n)
  var mst: [[Int]] = []
  while mst.count < n - 1 {
    let edge = minHeap.pop()
    let n1 = edge[1], n2 = edge[2]
    if !unionFind.union(n1, n2) {
      continue
    }
    mst.append([n1, n2])
  }
  return mst
}