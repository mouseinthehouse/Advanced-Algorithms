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

// Given a list of edges of a connected undirected graph,
// with nodes numbered from 1 to n,
// return a list edges making up the minimum spanning tree.
func minimumSpanningTree(_ edges: [[Int]], _ n: Int) -> [[Int]] {
  var adj = [Int: [[Int]]]()
  for i in 1..<n + 1 {
    adj[i] = []
  }
  for edge in edges {
    let n1 = edge[0], n2 = edge[1], weight = edge[2]
    adj[n1]!.append([n2, weight])
    adj[n2]!.append([n1, weight])
  }

  // Initialize the heap by choosing a single node
  // (in this case 1) and pushing all its neighbors.
  let minHeap = Heap()
  for edge in adj[1]! {
    let neighbor = edge[0], weight = edge[1]
    minHeap.push([weight, 1, neighbor])
  }
  
  var mst: [[Int]] = []
  var visit: Set<Int> = []
  visit.insert(1)
  while visit.count < n {
    // add heap thing here
    let edge = minHeap.pop()
    let n1 = edge[1], n2 = edge[2]
    if visit.contains(n2) {
      continue
    }

    mst.append([n1, n2])
    visit.insert(n2)
    for edge in adj[n2]! {
      let neighbor = edge[0], weight = edge[1] 
      if !visit.contains(neighbor) {
        minHeap.push([weight, n2, neighbor])
      }
    }
  }

  return mst
}