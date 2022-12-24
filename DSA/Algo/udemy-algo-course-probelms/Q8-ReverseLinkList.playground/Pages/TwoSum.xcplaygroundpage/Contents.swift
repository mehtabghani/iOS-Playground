import UIKit

/*
 Reverse Singly Link List
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
    
    
    // My solution: which makes copy of nodes hence not optimal.
    func reverse() -> Node<T>? {
        var newHead: Node<T>?
        var previous: Node<T>?
        var current = head
        
        while current != nil {
            previous = newHead
            newHead = Node(value: current!.value)
            newHead?.next = previous
            current = current?.next
        }
        return newHead;
    }
    
    /**
            Optimal solution - time: O(n), space: O(n)
     */
    func reverseOptimal() -> Node<T>? {
        var previous: Node<T>?
        var current = head
        
        while current != nil {
            let next = current?.next
            current?.next = previous
            previous = current
            current = next
        }

        return previous
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
print("-- Orignal --")

list.printList(node: list.head)

print("-- Reversed --")
let reverseNode = list.reverse()
list.printList(node: reverseNode)

print("-- Reverse Optimal --")
list.head = list.reverseOptimal() // change orignial
list.printList(node: list.head)

