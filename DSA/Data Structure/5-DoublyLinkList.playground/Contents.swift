import UIKit

/**
    Reference: https://github.com/raywenderlich/swift-algorithm-club/tree/master/Linked%20List
*/



public class LinkedListNode<T> {
    
    var value: T
    var nextNode: LinkedListNode?
    var previousNode: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}

public class LinkList<T: Equatable> {
    
    public typealias Node = LinkedListNode<T>

    private var head: Node?
    private var tail: Node?
    
    private(set) var count = 0
    
    var first: Node? {
        return head
    }
    
    var last: Node? {
        return tail
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(value: T) {
        let node = Node(value: value)
        count += 1

        if isEmpty {
            self.head = node
            self.tail = node
            return
        }
        
        let lastNode = self.tail
        lastNode?.nextNode = node
        node.previousNode = lastNode
        self.tail = node
    }
    
  
    func getAllValues() -> [T] {
        
        guard var node = head else {
            return []
        }
        
        var values = [T]()
        values.append(node.value)
        
        while let next = node.nextNode {
            values.append(next.value)
            node = next
        }
        
        return values
    }
    
    
    private func getNode(at index: Int) -> Node? {
        guard var node = head else {
            return nil
        }
        
        if index == 0 {
            return head
        }
    
        var nodeIndex = 1;

        while let next = node.nextNode {

            if nodeIndex == index {
                return next
            }
            node = next
            nodeIndex += 1
        }
        
        return nil
    }
    
    func insert(node newNode: Node, at index: Int) {
        if index == 0 {
            newNode.nextNode = head
            head?.previousNode = newNode
            head = newNode
            count += 1
            return
        }
        
        let node = getNode(at: index)
        newNode.previousNode = node?.previousNode
        newNode.nextNode = node
        node?.previousNode?.nextNode = newNode
       
        count += 1
    }
    
    subscript(index: Int) -> T? {
        
        guard index < count else {
            return nil
        }
        
        guard let node = getNode(at: index) else {
            return nil
        }
        
        return node.value
    }
    
    func getRepeatedValues() -> [T] {
        var uniqueValues = Array<T>()
        var repeatedValues = Array<T>()

        var node = head
        
        while node != nil  {
            
            let value = node!.value
            
            if uniqueValues.contains(where: { $0 == value }) {
                repeatedValues.append(value)
            } else {
                uniqueValues.append(value)
            }
            
            node = node!.nextNode
        }
    
        return repeatedValues
    }
    
    func reverse(array: inout [T], node: Node?) {
        
        guard let tempNode = node else {
            return
        }
        
        reverse(array: &array, node: tempNode.nextNode)
        array.append(tempNode.value)
    }
}


//-------------------------------

let list = LinkList<String>()
list.getAllValues()
list.append(value: "apple")
list.first?.value
list.last?.value

list.append(value: "orange")
list.append(value: "grapes")


list.insert(node: LinkedListNode(value: "lemon"), at: 1)
list.getAllValues()

list[0]
list[1]
list[2]
list[3]
list[4]

list.append(value: "apple")
list.append(value: "orange")

list.getRepeatedValues()

var reverseData = Array<String>()
list.reverse(array: &reverseData, node: list.first)
print(reverseData)




