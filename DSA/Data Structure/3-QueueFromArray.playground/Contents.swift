import UIKit

public struct Queue<T> {
    private var array = [T]()
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard array.count > 0 else {
            return nil
        }
        return array.removeFirst()
    }
    
    public func top() -> T? {
        
        if array.isEmpty  {
            return nil
        }
        return array.first
    }
    
    public var count: Int {
        return array.count
    }
}


var queue = Queue<String>()

queue.enqueue("apple")
queue.enqueue("orange")
queue.count
queue.dequeue()
queue.dequeue()
queue.dequeue()




