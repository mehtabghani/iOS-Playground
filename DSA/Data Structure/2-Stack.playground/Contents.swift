import UIKit

public struct Stack<T> {
    private var array = [T]()
    
    public mutating func push(_ element: T) {
        array.append(element)
        print("Pushed:", top() ?? "nil")
        array.removeFirst(2)
    }
    
    public mutating func pop() -> T? {
        print("Poped: ", top() ?? "nil")
        return array.popLast()
    }
    
    public func top() -> T? {
        return array.last
    }
    
    public var count: Int {
        return array.count
    }
    
    public func isEmpty() -> Bool {
        return array.isEmpty
    }
}


var stack = Stack<Int>()
stack.count
stack.push(1)
stack.push(2)
stack.push(3)
stack.count
stack.pop()
stack.top()




