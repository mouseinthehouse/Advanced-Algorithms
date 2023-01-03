class TrieNode {
  var children = [Character: TrieNode]()
  var word = false
}

class Trie {
  var root: TrieNode

  init() {
    root = TrieNode()
  }

  func insert(_ word: String) {
    var curr = root
    for c in word {
      if curr.children[c] == nil {
        curr.children[c] = TrieNode()
      }
      curr = curr.children[c]!
    }
    curr.word = true
  }

  func search(_ word: String) -> Bool {
    var curr = root
    for c in word {
      if curr.children[c] == nil {
        return false
      }
      curr = curr.children[c]!
    }
    return curr.word
  }

  func startsWith(_ prefix: String) -> Bool {
    var curr = root
    for c in prefix {
      if curr.children[c] == nil {
        return false
      }
      curr = curr.children[c]!
    }
    return true
  }
}