//: [Previous](@previous)

import Foundation

protocol Payload {
    associatedtype Key
    associatedtype Value
    
    var key: Key { get set }
    var value: Value { get set }
}

struct CachePayload<T: Hashable, U>: Payload {
    var key: T
    var value: U
}

class Node<T: Payload> {
    var previous: Node<T>?
    var next: Node<T>?
    var payload: T
    
    init(with payload: T) {
        self.payload = payload
    }
}

class List<T: Payload> {
    var head: Node<T>?
    var tail: Node<T>?
    var count = 0

    func isEmpty () -> Bool {
        return count == 0
    }
    
    func incrementCount() {
        count += 1
    }
    
    func insertAtTop(_ node: Node<T>) {
     
        if isEmpty() {
            head = node
            tail = node
            incrementCount()
            return
        }
        
        moveToHead(node)
        incrementCount()
    }
    
    func moveToHead(_ node: Node<T>) {
        
        if node === head {
            Swift.print("\(node.payload.key) Alread head")
            
        } else if node === tail {
            let lastNode = node.previous
            lastNode?.next = nil
            tail = lastNode
            
        } else {
            let previousNode = node.previous
            let nextNode = node.next
            previousNode?.next = nextNode
            nextNode?.previous = previousNode
        }
        
        //Apple -> Banana -> Oranges
        
        let topNode = head
        topNode?.previous = node
        node.next = topNode
        node.previous = nil
        
       head = node
    }
    
    func removeLast() -> Node<T>? {
        guard let lastNode = tail else {
            return nil
        }
        
        tail = lastNode.previous
        tail?.next = nil
        lastNode.next = nil
        lastNode.previous = nil
        count -= 1
        
        return lastNode
    }
    
    func print() {
        if isEmpty() {
            Swift.print("List is empty")
            return
        }

        var node = head
        
        while node != nil {
            Swift.print(node!.payload.key)
            node = node?.next
        }
    }
}

class LRUCache<T: Hashable, U> {
    
    var dict = [T : Node<CachePayload<T,U>>]()
    var list = List<CachePayload<T,U>>()
    
    let capacity: Int
    
    init(with capacity: Int) {
        self.capacity = capacity
    }
    
    func set(key: T, value: U) {
        
        //1 check in dictionary
        
        if let node = dict[key] {
            list.moveToHead(node)
            node.payload.value = value
            return
        }
        
        //2 not in dictonary then set in list
        
        //3 if capacity reached remove LRU item
        
        if capacity == list.count {
            if let node = list.removeLast() {
                dict[node.payload.key] = nil
            }
        }
        
        let payload = CachePayload(key: key, value: value)
        let node = Node(with: payload)
        
        list.insertAtTop(node)
        dict[key] = node
    }
    
    func reterive(for key: T) -> U? {
        
        guard let node = dict[key] else {
            return nil
        }
        
        list.moveToHead(node)
        dict[key] = node
        return node.payload.value
    }
    
    func print() {
        list.print()
    }
}

let cache = LRUCache<String, Int>(with: 3)
cache.print()

cache.set(key: "Apple", value: 0)
cache.set(key: "Banana", value: 1)
cache.set(key: "Oranges", value: 2)
cache.set(key: "Banana", value: 1)

cache.set(key: "Grapes", value: 3)

cache.reterive(for: "Banana")
cache.reterive(for: "Grapes")
cache.reterive(for: "Grapes")

cache.print()

