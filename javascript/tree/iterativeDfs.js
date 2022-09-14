/* Definition for a binary tree node:
    class TreeNode {
        constructor(val, left, right) {
             this.val = val;
             this.left = left;
             this.right = right;
        }
    }
*/

// Time and space: O(n)
function inorder(root) {
    let stack = [];
    let curr = root;

    while (curr != null || stack.length != 0) {
        while (curr != null) {
            stack.push(curr);
            curr = curr.left;
        }

        curr = stack.pop();
        console.log(curr.val);
        curr = curr.right;
    }  
}

// Time and space: O(n)
function preorder(root) {
    let stack = [];
    let curr = root;

    while (curr != null || stack.length != 0) {
        if (curr != null) {
            console.log(curr.val);
            if (curr.right != null) {
                stack.push(curr.right);
            }
            curr = curr.left;
        } else {
            curr = stack.pop();
        }
    }
}

// Time and space: O(n)
function postorder(root) {
    let stack = [root];
    let visit = [false];

    while (stack.length != 0) {
        let curr = stack.pop();
        let visited = visit.pop();
        if (curr != null) {
            if (visited) {
                console.log(curr.val);
            } else {
                stack.push(curr);
                visit.push(true);
                stack.push(curr.right);
                visit.push(false);
                stack.push(curr.left);
                visit.push(false);
            }
        }
    }
}