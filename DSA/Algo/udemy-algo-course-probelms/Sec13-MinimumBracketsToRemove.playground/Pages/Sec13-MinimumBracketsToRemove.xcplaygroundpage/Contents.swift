import UIKit

/*
 Given a string s of '(' , ')' and lowercase English characters.

 Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.

 Formally, a parentheses string is valid if and only if:

 It is the empty string, contains only lowercase characters, or
 It can be written as AB (A concatenated with B), where A and B are valid strings, or
 It can be written as (A), where A is a valid string.
 
 Example 1:

 Input: s = "lee(t(c)o)de)"
 Output: "lee(t(c)o)de"
 Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.
 
 Example 2:

 Input: s = "a)b(c)d"
 Output: "ab(c)d"
 
 Example 3:

 Input: s = "))(("
 Output: ""
 Explanation: An empty string is also valid.
 */

//My solution
func minRemoveToMakeValid(_ s: String) -> String {
    var stack = [Int]()
    var result = [String]()

    for char in Array(s) {
        let val = String(char)
        
        if (val == "("){
            result.append(val)
            if let i = result.lastIndex(of: "(") {
                stack.append(i)
            }
            continue
        }
        if (val == ")") {
            if (stack.isEmpty) {
              continue
            }
            stack.removeLast()
        }
        
        result.append(val)
    }
    
    while !stack.isEmpty {
        result.remove(at: stack.popLast()!)
    }
    return result.joined()
}

// Tutorial solution
func minRemoveToMakeValid2(_ s: String) -> String {
    var stack = [Int]()
    var arr = s.map { String($0) }
    
    for i in 0..<arr.count {
        if arr[i] == "(" {
            stack.append(i)
        }
        else if arr[i] == ")" && !stack.isEmpty {
            stack.removeLast()
        }
        else if arr[i] == ")" {
            arr[i] = ""
        }
    }
    
    while let i = stack.popLast() {
        arr[i] = ""
    }
    return arr.joined()
}

var s = "a)b(c)d";
assert(minRemoveToMakeValid2(s) == "ab(c)d")

s = "lee(t(c)o)de)"
assert(minRemoveToMakeValid2(s) == "lee(t(c)o)de")

s = "))(("
assert(minRemoveToMakeValid2(s) == "")
