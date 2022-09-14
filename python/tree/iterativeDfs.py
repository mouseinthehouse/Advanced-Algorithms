# TEST HERE:
https://leetcode.com/problems/binary-tree-inorder-traversal/
https://leetcode.com/problems/binary-tree-preorder-traversal/
https://leetcode.com/problems/binary-tree-postorder-traversal/
# DONT COMMIT THIS BLOCK IN UR CODE U JACKASS

# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val, left, right):
        self.val = val
        self.left = left
        self.right = right

# Time and space: O(n)
def inorder(root):
    stack = []
    curr = root

    while curr or stack:
        if curr:
            stack.append(curr)
            curr = curr.left
        else:
            curr = stack.pop()
            print(curr.val)
            curr = curr.right
    return res

# Time and space: O(n)
def preorder():
    stack = []
    curr = root
    while curr or stack:
        if curr:
            print(curr.val)
            if curr.right:
                stack.append(curr.right)
            curr = curr.left
        else:
            curr = stack.pop()
    return res

# Time and space: O(n)
def postorder():
    stack = [root]
    visit = [False]
    while stack:
        curr, visited = stack.pop(), visit.pop()
        if curr:
            if visited:
                print(curr.val)
            else:
                stack.append(curr)
                visit.append(True)
                stack.append(curr.right)
                visit.append(False)
                stack.append(curr.left)
                visit.append(False)
    return res