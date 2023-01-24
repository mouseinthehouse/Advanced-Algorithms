// Given a connected graph represented by a list of edges, where
// edge[0] = src, edge[1] = dst, and edge[2] = weight,
// find the shortest path from src to every other node in the 
// graph. There are n nodes in the graph.
// O(E * logV), O(E * logE) is also correct.
func shortestPath(_ edges: [[Int]], _ n: Int, _ src: Int) -> [Int: Int] {
  var adj = [Int: [[Int]]]()
  for i in 1..<n + 1 {
    adj[i] = []
  }
  
  // s = src, d = dst, w = weight
  for edge in edges {
    let s = edge[0], d = edge[1], w = edge[2]
    adj[s]!.append([d, w])
  }

  var shortest = [Int: Int]()
  let minHeap = Heap()
  minHeap.push([0, src])
  while !minHeap.isEmpty() {
    let elem = minHeap.pop()
    let w1 = elem[0], n1 = elem[1]
    if shortest[n1] != nil {
      continue
    }
    shortest[n1] = w1

    for edge in adj[n1]! {
      let n2 = edge[0], w2 = edge[1] 
      if shortest[n2] == nil {
        minHeap.push([w1 + w2, n2])
      }
    }
  }
  return shortest
}


// Swift does not have a built-in heap
// Min Heap
class Heap {
  var heap = [[Int]]()

  func push(_ val: [Int]) {
    heap.append(val)

    var i = heap.count - 1
    let childNode = heap[i]
    var parentIndex = parent(i)

    while i > 0 && childNode[0] < heap[parentIndex][0] {
        heap[i] = heap[parentIndex]
        i = parentIndex
        parentIndex = parent(i)
    }

    heap[i] = childNode
  }

  func pop() -> [Int] {
    if isEmpty() {
      // Normally we would throw an exception if heap is empty.
      return [-1, -1, -1]
    }
    if heap.count == 1 {
      return heap.removeLast()
    }

    let res = heap[0]
    // Move last value to root
    heap[0] = heap.removeLast()
    shiftDown(from: 0, until: heap.count)
    return res
  }

  func shiftDown(from i: Int, until end: Int) {
      let leftChild = leftChild(i)
      let rightChild = leftChild + 1

      var index = i
      if leftChild < end && heap[leftChild][0] < heap[index][0] {
          index = leftChild
      }
      if rightChild < end && heap[rightChild][0] < heap[index][0] {
          index = rightChild
      }
      if index == i {
          return
      }
      heap.swapAt(i, index)
      shiftDown(from: index, until: end)
  }

  func top() -> [Int] {
    if !isEmpty() {
      return heap[0]
    }
    // Normally we would throw an exception if heap is empty.
    return [-1, -1, -1]
  }

  func count() -> Int {
    return heap.count
  }

  func isEmpty() -> Bool {
    return heap.count == 0
  }

  func leftChild(_ i: Int) -> Int {
    return 2 * i + 1
  }

  func rightChild(_ i: Int) -> Int {
    return 2 * i + 2
  }

  func parent(_ i: Int) -> Int {
    return (i - 1) / 2
  }
}