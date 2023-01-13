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