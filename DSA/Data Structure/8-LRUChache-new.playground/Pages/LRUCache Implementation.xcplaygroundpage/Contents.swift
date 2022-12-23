import UIKit

protocol Payload {
    associatedtype Key
    associatedtype Value
    
    var key: Key { get set }
    var value: Value { get set }
}

struct CachePayload<T: Hashable, U>: Payload {
    var key: T
    var value: U
    
    init(key: T, value: U) {
        self.key = key
        self.value = value
    }
}

class Node<T: Payload> {
    
    var previous: Node<T>?
    var next: Node<T>?
    var payload: T
    init(payload: T) {
        self.payload = payload
    }
}

class LinkList<T: Payload> {
    var head: Node<T>?
    var tail: Node<T>?
    var count = 0
    
    var isEmpty: Bool {
        return head == nil
    }
    
    private func incrementCount() {
        count += 1
    }
    
    func insertAtTop(node: Node<T>) {
        
        if isEmpty {
            head = node
            tail = node
            incrementCount()
            return
        }
        
        
        moveToHead(node: node)
        incrementCount()
    }
    
    func moveToHead(node: Node<T>) {
        
        if node === head {
            Swift.print("Already Head")
            return
        }
        
        if node === tail {
            let lastNode = node.previous
            tail = lastNode
            lastNode?.next = nil
        }
        
        let previousNode = node.previous
        let nextNode = node.next
        
        previousNode?.next = nextNode
        nextNode?.previous = previousNode

        //node = blue
        let topNode = head //red
        node.next = topNode
        node.previous = nil
        topNode?.previous = node
        head = node
    }
    
    func removeLast() -> Node<T>? {
        guard let lastNode = tail else {
            return nil
        }

        Swift.print("removing: \(lastNode.payload.key)")

        tail = lastNode.previous
        tail?.next = nil
        
        Swift.print("Tail: \(tail!.payload.key)")

        lastNode.next = nil
        lastNode.previous = nil
        count -= 1
        
        return lastNode
    }
    
    func print() {
        
//        Swift.print("head: \(head?.payload.key)")
//        Swift.print("tail: \(tail?.payload.key)")

        var node = head
        
        while node != nil {
            if let payload = node?.payload {
                Swift.print("key: \(payload.key), value: \(payload.value)")
            }
            node = node?.next
        }
    }
}

//var list = LinkList<CachePayload<String, Int>>()
//let payload = CachePayload(key: "red", value: 0)
//let node = Node(payload: payload)
//list.insertAtTop(node: node)
//list.print()

class LRUCahce<T: Hashable, U> {
    
    var dictionary = [T: Node<CachePayload<T, U>>]()
    var list = LinkList<CachePayload<T, U>>()
    
    var capacity: Int
    
    init(capacity: Int) {
        self.capacity = capacity
    }
    
    func set(key: T, value: U) {
        
        //1 Already found in dictionary
        
        if let node = dictionary[key] {
            list.moveToHead(node: node)
            dictionary[key] = node
            return
        }
        
        //2 Not found in dictionary
        
        if capacity == list.count {
            //3 remove last element if capacity is full

            Swift.print("Capacity reached")
            if let lastNode = list.removeLast() {
                dictionary[lastNode.payload.key] = nil
            }
        }
        
        //4 insert
        let payload = CachePayload(key: key, value: value)
        let node = Node(payload: payload)
        list.insertAtTop(node: node)
        dictionary[key] = node
    }
    
    func retrevie(key: T) -> U? {
        guard let node = dictionary[key] else {
           return nil
        }
        
        list.moveToHead(node: node)
        dictionary[key] = node
        return node.payload.value
    }
    
    func print() {
        list.print()
    }
}

var cache = LRUCahce<String, Int>(capacity: 3)
cache.set(key: "red", value: 0)
cache.set(key: "blue", value: 1)
cache.set(key: "green", value: 2)
cache.set(key: "black", value: 3)
//cache.set(key: "orange", value: 4)
//cache.set(key: "red", value: 0)
//
cache.retrevie(key: "green")
cache.retrevie(key: "red")

cache.print()
