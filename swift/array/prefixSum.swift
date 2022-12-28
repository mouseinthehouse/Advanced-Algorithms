class PrefixSum {
  var prefix: [Int] = []

  init(_ nums: [Int]) {
    var total = 0
    for n in nums {
      total += n
      prefix.append(total)
    }
  }

  func rangeSum(_ left: Int, _ right: Int) -> Int {
    let preRight = prefix[right]
    let preLeft = left > 0 ? prefix[left - 1] : 0
    return preRight - preLeft
  }
}