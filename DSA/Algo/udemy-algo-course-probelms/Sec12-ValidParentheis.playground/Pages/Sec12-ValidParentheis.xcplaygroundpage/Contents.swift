import UIKit

/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Every close bracket has a corresponding open bracket of the same type.

 Example 1:
 Input: s = "()"
 Output: true
 
 Example 2:
 Input: s = "()[]{}"
 Output: true
 
 Example 3:
 Input: s = "(]"
 Output: false
 */

func isValid(_ s: String) -> Bool {
    if s.count % 2 != 0 {
        return false
    }
    
    var map: [Character: Character] = ["{":"}", "[":"]", "(":")"]
    var stack = [Character]()
    
    for char in s {
        if let _ = map[char] {
            stack.append(char)
            continue
        }
        
        if let last = stack.last, map[last] == char {
            stack.removeLast()
        } else {
            return false
        }
    }
    
    return stack.isEmpty
}

var s = "()[]{}"; //true
isValid(s)
s = "({})"; //true
isValid(s)
s = "()" // true
isValid(s)
s = "(]" //false
isValid(s)
s = "]" //false
isValid(s)
