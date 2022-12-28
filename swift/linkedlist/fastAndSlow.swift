class ListNode {
  var next: ListNode?
  var val: Int

  init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}

// Find the middle of a linked list with two pointers.
// Time: O(n), Space: O(1)
func middleOfList(_ head: ListNode?) -> ListNode? {
  var slow = head, fast = head
  while fast != nil && fast?.next != nil {
    slow = slow?.next
    fast = fast?.next?.next
  }
  return slow
}

// Determine if the linked list contains a cycle.
// Time: O(n), Space: O(1)
func hasCycle(_ head: ListNode?) -> Bool {
  var slow = head, fast = head
  while fast != nil && fast?.next != nil {
    slow = slow?.next
    fast = fast?.next?.next
    if slow === fast {
      return true
    }
  }
  return false
}

// Determine if the linked list contains a cycle and
// return the beginning of the cycle, otherwise return null.
// Time: O(n), Space: O(1)
func cycleStart(_ head: ListNode?) -> ListNode? {
  var slow = head, fast = head
  while fast != nil && fast?.next != nil {
    slow = slow?.next
    fast = fast?.next?.next
    if slow === fast {
      break
    }
  }

  if fast == nil || fast?.next == nil {
    return nil
  }

  var slow2 = head
  while slow !== slow2 {
    slow = slow?.next
    slow2 = slow2?.next
  }
  return slow
}