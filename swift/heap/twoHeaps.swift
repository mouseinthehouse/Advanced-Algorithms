// Swift does not have a built-in heap
// Min Heap
class Heap {
  var heap = [Int]()

  func push(_ val: Int) {
    heap.append(val)

    var i = heap.count - 1
    let childNode = heap[i]
    var parentIndex = parent(i)

    while i > 0 && childNode < heap[parentIndex] {
        heap[i] = heap[parentIndex]
        i = parentIndex
        parentIndex = parent(i)
    }

    heap[i] = childNode
  }

  func pop() -> Int {
    if isEmpty() {
      // Normally we would throw an exception if heap is empty.
      return -1
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
      if leftChild < end && heap[leftChild] < heap[index] {
          index = leftChild
      }
      if rightChild < end && heap[rightChild] < heap[index] {
          index = rightChild
      }
      if index == i {
          return
      }
      heap.swapAt(i, index)
      shiftDown(from: index, until: end)
  }

  func top() -> Int {
    if !isEmpty() {
      return heap[0]
    }
    // Normally we would throw an exception if heap is empty.
    return -1
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


class Median {
  var small = Heap()
  var large = Heap()

  func insert(_ num: Int) {
    small.push(-1 * num)
    if !small.isEmpty() && !large.isEmpty() && -1 * small.top() > large.top() {
      large.push(-1 * small.top())
      small.pop()
    }

    // Handle uneven size
    if small.count() > large.count() + 1 {
      large.push(-1 * small.top())
      small.pop()
    }
    if large.count() > small.count() + 1 {
      small.push(-1 * large.top())
      large.pop()
    }
  }

  func getMedian() -> Double {
    if small.count() > large.count() {
      return Double(-1 * small.top())
    }
    else if large.count() > small.count() {
      return Double(large.top())
    }

    // Even # of elements, return avg of two middle nums
    return (-1 * Double(small.top()) + Double(large.top())) / 2
  }
}