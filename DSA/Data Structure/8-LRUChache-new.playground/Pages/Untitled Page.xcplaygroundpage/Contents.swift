//: [Previous](@previous)

import Foundation



















protocol Payload {
    associatedtype Key
    associatedtype Value
    
    var key: Key { get set }
    var value: Value {get set}
}

struct CachePayload<T: Hashable, U>: Payload {
    var key: T
    var value: U
}

class Node<T: Payload> {
    var next: Node<T>?
    var previous: Node<T>?
    var payload: T?
    
    init(payload: T) {
        self.payload = payload
    }
}


class List<T: Payload> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var count = 0
    
    func incrementCount() {
        count += 1
    }
    
    func insert(node: Node<T>) {
        
        if head == nil {
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
            return
        }
        
        if node === tail {
            let lastNode = tail?.previous
            lastNode?.next = nil
        } else {
            // in middle
            let previousNode = node.previous
            let nextNode = node.next
            
            previousNode?.next = nextNode
            nextNode?.previous = previousNode
        }
    
        //setting head
        let topNode = head
        topNode?.previous = node
        node.next = topNode
        head = node
    }
    
    func removeFromTail() -> T? {
        let lastNode = tail
        tail = lastNode?.previous
        tail?.next = nil
        lastNode?.next = nil
        lastNode?.previous = nil
        count -= 0
        return lastNode?.payload
    }
    
    func print() {
        var node = head
        
        while node != nil {
            if let payload = node?.payload {
                Swift.print("Key: \(payload.key), Value: \(payload.value)")
            }
            node = node?.next
        }
    }
}

class LRUCache<T: Hashable, U> {
    
    var dict = [T: Node<CachePayload<T, U>>]()
    var list = List<CachePayload<T, U>>()
    
    let capacity: Int
    
    init(capacity: Int) {
        self.capacity = capacity
    }
    
    func get(key: T) -> U? {
        
        if let node = dict[key] {
            list.moveToHead(node: node)
            return node.payload?.value
        }
        
        return nil
    }
    
    func set(key: T, value: U) {
        // 1 - check if already present
        if let node = dict[key] {
            node.payload?.value = value
            list.moveToHead(node: node)
            return
        }
        
        //2 - if cache capacity hit remove item from tail
        if list.count == capacity {
            if let payload = list.removeFromTail() {
                dict.removeValue(forKey: payload.key)
            }
        }
        
        let payload = CachePayload(key: key, value: value)
        let node = Node(payload: payload)

        dict[key] = node
        list.insert(node: node)
    }
}

let cache = LRUCache<String, String>(capacity: 3)
cache.set(key: "1", value: "apple")
cache.set(key: "2", value: "banana")
cache.set(key: "3", value: "orange")
cache.list.print()
print("- Get -")
cache.get(key: "2")
cache.list.print()
print("- ADD -")
cache.set(key: "4", value: "blueberry")
//cache.set(key: "5", value: "grapefruit")

cache.list.print()
