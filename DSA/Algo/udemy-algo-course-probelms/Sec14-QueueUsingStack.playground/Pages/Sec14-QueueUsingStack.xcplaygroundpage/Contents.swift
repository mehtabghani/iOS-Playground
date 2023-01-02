import UIKit

/*
 
 */



class MyQueue {
    var inStack = [Int]()
    var outStack = [Int]()
    
    func push(_ x: Int) {
        inStack.append(x)
    }

    
    func pop() -> Int {
        if (outStack.isEmpty) {
            let reversed = inStack.reversed()
            outStack.append(contentsOf: reversed)
            inStack = []
        }
        return outStack.removeLast()
    }
    
    func peek() -> Int {
        if (outStack.isEmpty) {
            let reversed = inStack.reversed()
            outStack.append(contentsOf: reversed)
            inStack = []
        }
        return outStack.last!
    }
    
    func empty() -> Bool {
        return inStack.isEmpty && outStack.isEmpty
    }
    
    private func fillIfNeeded() {
        if (!outStack.isEmpty) {
            return
        }
        
        let reversed = inStack.reversed()
        outStack.append(contentsOf: reversed)
        inStack = []
    }
    
    /**
     Solution 2
     **/
    //    func pop() -> Int {
    //        if (outStack.isEmpty) {
    //            while !inStack.isEmpty {
    //                outStack.append(inStack.removeLast())
    //            }
    //        }
    //
    //        return outStack.removeLast()
    //    }
    //
    //    func peek() -> Int {
    //        if let item = outStack.last {
    //            return item
    //        }
    //
    //        return inStack.first!
    //    }
    
}


//Your MyQueue object will be instantiated and called as such:
let obj = MyQueue()
obj.push(1)
obj.push(2)
assert(obj.peek() == 1)
assert(obj.pop() == 1)
assert(obj.pop() == 2)
assert(obj.empty() == true)

