import UIKit

/*
 https://leetcode.com/problems/flatten-a-multilevel-doubly-linked-list/description/
 
 */


//Definition for a Node.
public class Node {
    public var val: Int
    public var prev: Node?
    public var next: Node?
    public var child: Node?
    public init(_ val: Int) {
        self.val = val
        self.prev = nil
        self.next = nil
        self.child = nil
     }
 }
 
/**
 Time: O(2n) -> O(n)
 Space: O(1) -- We are not storing variable, we are just assigning a pointer to new variable
 */

class Solution {
    func flatten(_ head: Node?) -> Node? {
        var current = head
        while current != nil {
            var child = current?.child

            if child != nil {
                var newNext: Node?
                var newTail: Node?
                newNext = child

                while child?.next != nil {
                    child = child?.next
                }
                newTail = child

                var next = current?.next
                current?.next = newNext
                newNext?.prev = current
                newTail?.next = next
                next?.prev = newTail
                current?.child = nil

            }

            current = current?.next
        }
        // current = head
        // while current != nil {
        //     print("current:\(current?.val)")
        //     current = current?.next
        // }
        
        return head
    }
}

