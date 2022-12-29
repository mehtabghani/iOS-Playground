import UIKit

/**
 https://leetcode.com/problems/linked-list-cycle-ii/description/
 */
  //Definition for singly-linked list.
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }
 

    /*
     Time: O(2n) -> O(n)
     Space: O(1)
     */
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var hare = head
        var tortoise = head

        while(true) {
            hare = hare?.next
            tortoise = tortoise?.next

            if hare == nil || hare?.next == nil {
                return nil
            } else {
                hare = hare?.next
            }
            if hare === tortoise {
                break
            }
        }
        
        // print("Hare: \(hare?.val)")
        // print("tortoise: \(tortoise?.val)")

        var p1 = head
        var p2 = tortoise

        while p1 !== p2 {
            p1 = p1?.next
            p2 = p2?.next
        }
        return p1
    }

