// Time: O(n^2), Space: O(n)
func longest(_ s: String) -> Int {
  // It's easier to work with array of Characters in Swift
  let arrS = Array(s)
  var length = 0

  for i in 0..<arrS.count {
    // odd length
    var l = i, r = i
    while l >= 0 && r < arrS.count && arrS[l] == arrS[r] {
      if r - l + 1 > length {
        length = r - l + 1
      }
      l -= 1
      r += 1
    }

    // even length
    l = i
    r = i + 1
    while l >= 0 && r < arrS.count && arrS[l] == arrS[r] {
      if r - l + 1 > length {
        length = r - l + 1
      }
      l -= 1
      r += 1
    }
  }
  return length
}


// Same solution, without duplicate code.
// Time: O(n^2), Space: O(n)
func longest(_ s: String) -> Int {
  // It's easier to work with array of Characters in Swift
  let arrS = Array(s)
  var length = 0
  
  for i in 0..<arrS.count {
    // odd length
    length = max(length, helper(arrS, i, i))

    // even length
    length = max(length, helper(arrS, i, i + 1))
  }
  return length
}

func helper(_ s: [String.Element], _ l: Int, _ r: Int) -> Int {
  // Swift treats parameters as constants
  var newL = l
  var newR = r
  var maxLength = 0

  while newL >= 0 && newR < s.count && s[newL] == s[newR] {
    if newR - newL + 1 > maxLength {
      maxLength = newR - newL + 1
    }
    newL -= 1
    newR += 1
  }
  return maxLength
}