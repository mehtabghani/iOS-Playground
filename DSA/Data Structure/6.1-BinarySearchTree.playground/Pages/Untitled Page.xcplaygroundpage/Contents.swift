
/**
    Reference:
*/

class BinarySearchTree<T: Comparable> {
    var value: T
    private(set) var left: BinarySearchTree?
    private(set) var right: BinarySearchTree?
    private(set) var parent: BinarySearchTree?
    
    enum SearchResult: String {
        case Found
        case NotFound
    }
    
    var isRoot: Bool {
        return parent == nil
    }
    
    var isLeftChild: Bool {
        return parent?.left === self
    }
    
    var isRightChild: Bool {
        return parent?.right === self
    }
    
    var hasLeftChild: Bool {
        return left != nil
    }
    
    var hasRightChild: Bool {
        return right != nil
    }
    
    /**
     Initializers
     */
    init(rootValue: T) {
        self.value = rootValue
    }
    
    public convenience init(array: [T]) {
       precondition(array.count > 0)
       self.init(rootValue: array.first!)
       
        for v in array.dropFirst() {
         insert(value: v)
       }
     }
    
    /**
     Traversal Methods
     */
    
    public func traverseInOrder(process: (T) -> Void) {
       left?.traverseInOrder(process: process)
       process(value)
       right?.traverseInOrder(process: process)
     }

     public func traversePreOrder(process: (T) -> Void) {
       process(value)
       left?.traversePreOrder(process: process)
       right?.traversePreOrder(process: process)
     }

     public func traversePostOrder(process: (T) -> Void) {
       left?.traversePostOrder(process: process)
       right?.traversePostOrder(process: process)
       process(value)
     }
    
    /**
     Insert Node
     */
    public func insert(value: T) {
        
        if value < self.value {
            
            if let left = left {
                left.insert(value: value)
            } else {
                left = BinarySearchTree<T>(rootValue: value)
                left?.parent = self
            }
            
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree<T>(rootValue: value)
                right?.parent = self
            }
        }
    }
    
    /**
        Search Using recursion
     */
    func search(value: T) -> SearchResult {
        
        if value < self.value {
            return left?.search(value: value) ?? .NotFound
        } else if value > self.value {
            return right?.search(value: value) ?? .NotFound
        } else if  value == self.value {
            return .Found
        }
        
        return .NotFound
    }

    /**
     Search using loop
     */
    
    func search2(value: T) -> SearchResult {
        var node: BinarySearchTree? = self
        while  node != nil {
            
            if value < node!.value {
                node = node!.left
            } else if value > node!.value {
                node = node!.right
            } else {
                return .Found
            }
        }
        
        return .NotFound
    }
    
    /**
     Search & return node
     */
    
    func searchNode(by value: T) -> BinarySearchTree? {
        
        var node: BinarySearchTree? = self
        while node != nil {
            
            if value < node!.value {
                node = node?.left
            } else if value > node!.value {
                node = node?.right;
            } else {
                return node
            }
        }
        
        return nil
    }
    
    func maximum() -> BinarySearchTree {
        
        var node = self
        
        while let next = node.right {
            node = next
        }
        
        print("max value \(node.value)")
        return node
    }
    
    func minimum() -> BinarySearchTree {
        
        var node = self
        
        while let next = node.left {
            node = next
        }
        
        print("min value \(node.value)")
        return node
    }
    
    func reconnectParent(node: BinarySearchTree?) {
        
        if let parent = parent {
            
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        
        node?.parent = parent
    }
    
    
    
    
    /**
     Delete Node
     */
    
    
    func remove(value: T) {
        guard let node = searchNode(by: value) else {
            return
        }

        if node.isRoot, let root = node.remove() {
            self.value = root.value
            self.left = root.left
            self.right = root.right
        } else {
            node.remove()
        }
        
    }
    
    private func remove() -> BinarySearchTree? {
        
        let replacementNode: BinarySearchTree?
        
        if let right = right {
            replacementNode = right.minimum()
        } else if let left = left {
            replacementNode = left.maximum()
        } else {
            replacementNode = nil
        }
        
        replacementNode?.remove()
        
        replacementNode?.right = right
        replacementNode?.left = left
        right?.parent = replacementNode
        left?.parent = replacementNode
        
        reconnectParent(node: replacementNode)
        
        cleanUp()
    
        return replacementNode
    }
    
    func cleanUp() {
        parent = nil
        left = nil
        right = nil
    }
    
}

extension BinarySearchTree: CustomStringConvertible {
  public var description: String {
    var s = ""
    if let left = left {
      s += "(\(left.description)) <- "
    }
    s += "\(value)"
    if let right = right {
      s += " -> (\(right.description))"
    }
    return s
  }
}


let bst = BinarySearchTree(rootValue: 7)

bst.insert(value: 2)
bst.insert(value: 5)
bst.insert(value: 10)
bst.insert(value: 9)
bst.insert(value: 1)

//
//bst.search(value: 2)
//bst.search(value: 1)
//bst.search(value: 6)
//
//bst.search2(value: 2)
//bst.search2(value: 1)
//bst.search2(value: 6)

//print("-----Pre order----")
//bst.traversePreOrder(process: { print($0)} )
//print("-----In order----")
//bst.traverseInOrder(process: { print($0)} )
//print("-----Post order----")
//bst.traversePostOrder(process: { print($0)} )


bst.remove(value: 2)
print(bst)


