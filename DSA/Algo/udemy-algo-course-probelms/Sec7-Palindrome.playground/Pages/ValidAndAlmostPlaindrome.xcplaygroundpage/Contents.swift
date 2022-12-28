//: [Previous](@previous)

import Foundation

/*
 Given a string s, return true if the s can be palindrome after deleting at most one character from it.

 Example 1:

 Input: s = "aba"
 Output: true
 Example 2:

 Input: s = "abca"
 Output: true
 Explanation: You could delete the character 'c'.
 Example 3:

 Input: s = "abc"
 Output: false
  
 Constraints:

 1 <= s.length <= 105
 s consists of lowercase English letters.
 
 */
func getAlphaNumericValue(_ s: String) -> String {
    return s.replacingOccurrences(of: "[^A-Za-z0-9]",
                                            with: "",
                                  options: [.regularExpression]).lowercased()
}


func validPalindrome2PointerOuter(_ arr: [String], left: Int, right: Int) -> Bool {
    var l = left
    var r = right
    while l < r {
        if arr[l] != arr[r] {
            return false
        }
        
        l += 1
        r -= 1
    }
    
    return true
}

func validPalindrome(_ s: String) -> Bool {
    let str = getAlphaNumericValue(s)
    let arr = str.map{ String($0) }
    
    var left = 0
    var right = arr.count-1
        
    while left < right {
        if arr[left] != arr[right] {
            return validPalindrome2PointerOuter(arr, left: left + 1, right: right) || validPalindrome2PointerOuter(arr, left: left, right: right - 1)
        }
        
        left += 1
        right -= 1
    }
    
    return true
}


validPalindrome("aba") // true
validPalindrome("abca") // true
validPalindrome("abc") // false
