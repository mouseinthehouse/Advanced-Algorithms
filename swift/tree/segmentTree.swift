class SegmentTree {
  var sum: Int
  var left: SegmentTree?
  var right: SegmentTree?
  var L: Int
  var R: Int

  init(_ total: Int, _ L: Int, _ R: Int) {
    self.sum = total
    self.left = nil
    self.right = nil
    self.L = L
    self.R = R
  }

  // O(n)
  static func build(_ nums: [Int], _ L: Int, _ R: Int) -> SegmentTree? {
    if L == R {
      return SegmentTree(nums[L], L, R)
    }

    let M = (L + R) / 2
    let root: SegmentTree? = SegmentTree(0, L, R)
    root?.left = SegmentTree.build(nums, L, M)
    root?.right = SegmentTree.build(nums, M + 1, R)
    root!.sum = root!.left!.sum + root!.right!.sum
    return root
  }

  // O(log n)
  func update(_ index: Int, _ val: Int) {
    if L == R {
      sum = val
      return
    }

    let M = (L + R) / 2
    if index > M {
      right?.update(index, val)
    }
    else {
      left?.update(index, val)
    }
    sum = left!.sum + right!.sum
  }

  // O(log n)
  func rangeQuery(_ L: Int, _ R: Int) -> Int {
    if self.L == L && self.R == R {
      return sum
    }

    let M = (self.L + self.R) / 2
    if L > M {
      return right!.rangeQuery(L, R)
    }
    else if R <= M {
      return left!.rangeQuery(L, R)
    }
    else {
      return (left!.rangeQuery(L, M) + 
             right!.rangeQuery(M + 1, R))
    }
  }
}