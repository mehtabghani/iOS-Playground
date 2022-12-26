import UIKit

/*
 https://leetcode.com/problems/reverse-linked-list-ii/
 Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.
 
 Input: head = [1,2,3,4,5], left = 2, right = 4
 Output: [1,4,3,2,5]
 
 Input: head = [5], left = 1, right = 1
 Output: [5]
 */

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    func append(_ value: T) {
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
            tail = head
            return;
        }
        
        var last = tail
        last?.next = newNode
        tail = newNode
    }
    
    /**
         [1,2,3,4,5,6,7]
         left: 3 , right: 5
     */
    func reverseBetween(_ head: Node<T>?, _ left: Int, _ right: Int) -> Node<T>? {
        var position = 1
        var current = head
        var start: Node<T>?
        
        while position < left {
            start = current //2
            current = current?.next //7
            position += 1
        }
        
        var newList: Node<T>?
        tail = current

        while position >= left && position <= right  {
            var next = current?.next
            current?.next = newList
            newList = current
            current = next
            position += 1
        }
        
        start?.next = newList
        tail?.next = current
        
        if left == 1 { // incase left is the first node
            return newList
        }
        
        return head
    }
    
    func printList(node: Node<T>?) {
        if (node == nil) {
            return
        }
        
        Swift.print(node!.value)
        printList(node: node?.next)
    }
}


var list = LinkList<Int>()
[1,2,3,4,5].map{ list.append($0) }

//print("-- Orignal --")
//list.printList(node: list.head)

print("-- Reversed --")
let reversedList = list.reverseBetween(list.head, 1 , 4)
list.printList(node: reversedList)

