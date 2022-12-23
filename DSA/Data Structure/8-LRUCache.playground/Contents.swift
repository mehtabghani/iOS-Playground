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
    
    init(key: T, value: U){
        self.key = key
        self.value = value
    }
}

class Node<T: Payload> {
    var next: Node<T>?
    var previous: Node<T>?
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
        head == nil
    }
    
    private func incrementCount() {
        count += 1
    }
    
    func insert(_ payload: T) -> Node<T> {
        let newNode = Node(payload: payload)
        
        if isEmpty {
            Swift.print("isEmpty, inserting \(payload.key)")
            head = newNode
            tail = newNode
            incrementCount()
            return newNode
        }
        
        moveToHead(node: newNode)
        incrementCount()
        
        return newNode
    }
    
    func moveToHead(node: Node<T>) {
        
        Swift.print("MoveToHead: \(node.payload.key)")
        
        if node === head {
            Swift.print("Already Head")
            return
        }
        
        
        if node === tail {
            Swift.print("\(node.payload.key) == tail")
            let previous = node.previous
            previous?.next = nil
            tail = previous
        }

        let previousNode = node.previous
        let nextNode = node.next
        
        previousNode?.next = nextNode
        nextNode?.previous = previousNode
        
        node.previous = nil
        node.next = head
        head?.previous = node
        head = node
        
        Swift.print("Head: \(head?.payload.key)")
        Swift.print("Tail: \(tail?.payload.key)")

    }
    
    func removeTail() -> Node<T>? {
        Swift.print("Prev tail: \(tail?.payload.key)")

        let node = tail //red
        tail = node?.previous //blue
        tail?.next = nil
        count -= 1
        
        node?.next = nil
        node?.previous = nil
        
        Swift.print("New tail: \(tail?.payload.key)")

        return node
    }
    
    func print() {
        
        if isEmpty {
            return
        }
        
        var node = head
        
        while node != nil {
            let payload = node!.payload
            Swift.print("key: \(payload.key), value: \(payload.value)")
            node = node!.next
        }
    }
}

class LRUCache<T: Hashable, U> {
   typealias CPayload = CachePayload<T, U>
   
    private(set) var capacity: Int
    private(set) var list = LinkList<CPayload>()
    private(set) var dictionary = [T: Node<CPayload>]()
    
    init(capacity: Int) {
        self.capacity = capacity
    }
    
    func setObject(key: T, value: U) {
       
        //1 found in dictionary
        
        if let node = dictionary[key] {
            
            //2 update head
            list.moveToHead(node: node)
            node.payload.value = value
            return
        }
        
        //3 if capacity
        if capacity == list.count {
            Swift.print("--Capacity full--")
            if let tempKey = list.removeTail()?.payload.key {
                Swift.print("Removed key: \(tempKey)")
                dictionary[tempKey] = nil
            }
        }
        
        //4 Not found in dictionary

        let payload = CachePayload(key: key, value: value)
        let newNode = list.insert(payload)
        dictionary[key] = newNode
        
    }
    
    func reteriveObject(key: T) -> U? {
        
        guard let node = dictionary[key] else {
          return nil
        }
        
        Swift.print(node.payload.key)
        
        list.moveToHead(node: node)
        return node.payload.value
    }
    
    func print() {
        list.print()
    }
    
}


let cache = LRUCache<String, Int>(capacity: 3)
cache.setObject(key: "red", value: 0)
cache.setObject(key: "blue", value: 1)
cache.setObject(key: "green", value: 2)
cache.setObject(key: "black", value: 3)
cache.setObject(key: "orange", value: 4)

cache.reteriveObject(key: "blue")
cache.reteriveObject(key: "black")

cache.print()

