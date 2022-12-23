import UIKit

public class Node<T: Comparable> {
    var left: Node?
    var right: Node?
    var parent: Node?
    var value: T
    
    
    var isLeftChild: Bool {
        return parent?.left === self
    }
    
    var isRightChild: Bool {
        return parent?.right === self
    }
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    var isRoot: Bool {
        return parent == nil
    }
    
    init(value: T) {
        self.value = value
    }
    
    
    func maximum() -> Node? {
        var node: Node? = self
      
        while let next = node?.right {
            node = next
        }
        
        return node
    }
    
    func minimum() -> Node? {
        var node: Node? = self
        
        while let next = node?.left {
            node = next
        }
        
        return node
    }
    
}


public class BinarySearchTree<T: Comparable> {
    
    var root: Node<T>?
    var count = 0
    
    var isEmpty: Bool {
        return root == nil
    }
    
    func add(value: T) {
       
        if root == nil {
            root = Node(value: value)
            count += 1
            return
        }
        
        var node: Node? = root
        let newNode = Node(value: value)

        while node != nil {
            
            if value < node!.value {

                if node!.left == nil {
                    node!.left = newNode
                    newNode.parent = node
                    count += 1
                    break
                }
                
                node = node?.left
                
            } else if value > node!.value {
                
                if node!.right == nil {
                    node!.right = newNode
                    newNode.parent = node
                    count += 1
                    break
                }
                
                node = node?.right
            }
        }
    }
    
    
    func search(value: T) -> Node<T>? {
        var node: Node? = root
        
        while node != nil {
            
            if value < node!.value {
                node = node!.left
            } else if value > node!.value {
                node = node!.right
            } else {
                return node
            }
        }
        
        return nil
    }
    
    func remove(value : T) -> T? {
        
        if isEmpty { //case 1: root
            return nil
        }
        
        if let node = search(value: value) { //case 2: Not Foun
            let deletedNode = remove(node: node, value: value)
            count -= 1
            return deletedNode?.value
        }
        
        return nil
    }

    
    func traversInOrder(node: Node<T>?) {
        
        if node == nil {
            return
        }
        
        traversInOrder(node: node?.left)
        print(node!.value)
        traversInOrder(node: node?.right)
    }
    
    
    private func remove(node: Node<T>?, value: T) -> Node<T>? {
        
        guard let currentNode = node else {
            return nil
        }

        var replacementNode: Node<T>?
        
        if let right = currentNode.right {
            replacementNode = right.minimum()
        } else if let left = currentNode.left {
            replacementNode = left.maximum()
        } else {
            replacementNode = nil
        }
        
        print("CurrentNode: \(currentNode.value)")
        print("ReplacementNode: \(String(describing: replacementNode?.value))")
        print("Left: \(String(describing: currentNode.left?.value))")
        print("Right: \(String(describing: currentNode.right?.value))")

        remove(node: replacementNode, value: value)
        
        //setting child
        replacementNode?.left = currentNode.left
        replacementNode?.right = currentNode.right
        
        //setting chid's parent references
        currentNode.left?.parent = replacementNode
        currentNode.right?.parent = replacementNode
        
        //setting parent's reference
        if let parent = currentNode.parent {
            if currentNode.isLeftChild {
                parent.left = replacementNode
            } else {
                parent.right = replacementNode
            }
        }
        
        replacementNode?.parent = currentNode.parent

        //setting root reference
        if currentNode.isRoot {
            root = replacementNode
        }

        //cleaning up
        currentNode.parent = nil
        currentNode.left = nil
        currentNode.right = nil
        
        return replacementNode
    }

}


let bst = BinarySearchTree<Int>()
bst.add(value: 7)
bst.add(value: 2)
bst.add(value: 5)
bst.add(value: 1)
bst.add(value: 10)
bst.add(value: 9)
bst.add(value: 8)
bst.add(value: 12)

bst.search(value: 2)?.value
bst.search(value: 0)?.value
bst.count

//bst.traversInOrder(node: bst.root)
bst.remove(value: 7)
bst.traversInOrder(node: bst.root)


