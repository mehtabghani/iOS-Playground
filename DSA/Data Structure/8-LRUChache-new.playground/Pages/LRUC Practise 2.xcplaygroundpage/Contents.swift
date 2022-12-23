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
    
    func insertAtTop(_ node: Node<T>) {

        if head == nil {
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
            Swift.print("\(node.payload!.key) is already head")
            return
        }
        
        if node === tail {
            let lastNode =  node.previous
            lastNode?.next = nil
            tail = lastNode
        } else {
            // in middle
            let previousNode = node.previous
            let nextNode = node.next
            
            previousNode?.next = nextNode
            nextNode?.previous = previousNode
        }
        
        let top = head
        node.previous = nil
        node.next = top
        top?.previous = node
        head = node
    }
    
    func removeLast() -> Node<T>? {
        
        let last = tail
        let previous = last?.previous
        
        previous?.next = nil
        last?.next = nil
        last?.previous = nil
        
        tail = previous
        
        count -= 1
        
        return last
    }
    
    func print() {
        var node = head
        
        if node == nil {
            Swift.print("list is empty")
            return
        }
        
        while node != nil {
            Swift.print(node!.payload!.key)
            node = node?.next
        }
    }
}

class LRUCache<T: Hashable, U> {
    var dict = [T: Node<CachePayload<T,U>>]()
    var list = List<CachePayload<T,U>>()
    let capacity: Int
    
    init(with capacity: Int) {
        self.capacity = capacity
    }
    
    func set(key: T, value: U) {
        
        
        // 1 check value in dict
        
        if let node = dict[key] {
            //update value
            node.payload?.value = value
            list.moveToHead(node)
            return
        }
        
        // 2 not present dict, then create

        if list.count == capacity  {
            let node = list.removeLast()
            if let key = node?.payload?.key {
                dict.removeValue(forKey: key)
            }
        }
        
        let payload = CachePayload(key: key, value: value)
        let node = Node(payload: payload)
        list.insertAtTop(node)
        dict[key] = node
    }
    
    func reteriveValue(for key: T) -> U? {
        if let node = dict[key] {
            list.moveToHead(node)
            return node.payload?.value
        }
        
        return nil
    }
    
    func print() {
        list.print()
    }
}

var cache = LRUCache<String, String>(with: 3)

cache.set(key: "apple", value: "apple value")
cache.set(key: "orange", value: "orange value")
cache.set(key: "grapes", value: "grapes value")
cache.set(key: "banana", value: "banana value")
cache.set(key: "lemon", value: "lemon value")
cache.set(key: "pineapple", value: "pineapple value")

cache.reteriveValue(for: "apple")
cache.reteriveValue(for: "lemons")


cache.print()
Swift.print(cache.dict.keys)
