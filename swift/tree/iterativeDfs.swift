// Definition for a binary tree node.
class TreeNode {
  var val: Int
  var left: TreeNode?
  var right: TreeNode?

  init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

// Time and space: O(n)
func inorder(_ root: TreeNode?) {
  var stack: [TreeNode?] = []
  var curr = root

  while curr != nil || !stack.isEmpty {
    if curr != nil {
      stack.append(curr)
      curr = curr?.left
    }
    else {
      curr = stack.removeLast()
      print(curr!.val)
      curr = curr?.right
    }
  }
}

// Time and space: O(n)
func preorder(_ root: TreeNode?) {
  var stack: [TreeNode?] = []
  var curr = root
  while curr != nil || !stack.isEmpty {
    if curr != nil {
      print(curr!.val)
      if curr?.right != nil {
        stack.append(curr?.right)
      }
      curr = curr?.left
    }
    else {
      curr = stack.removeLast()
    }
  }
}

// Time and space: O(n)
func postorder(_ root: TreeNode?) {
  var stack = [root]
  var visit = [false]
  while !stack.isEmpty {
    let curr = stack.removeLast(), visited = visit.removeLast()
    if curr != nil {
      if visited {
        print(curr!.val)
      }
      else {
        stack.append(curr)
        visit.append(true)
        stack.append(curr?.right)
        visit.append(false)
        stack.append(curr?.left)
        visit.append(false)
      }
    }
  }
}