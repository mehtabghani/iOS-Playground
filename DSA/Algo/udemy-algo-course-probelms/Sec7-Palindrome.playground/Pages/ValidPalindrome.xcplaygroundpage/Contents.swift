import UIKit

/*
     A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

     Given a string s, return true if it is a palindrome, or false otherwise.

     Example 1:

     Input: s = "A man, a plan, a canal: Panama"
     Output: true
     Explanation: "amanaplanacanalpanama" is a palindrome.
     Example 2:

     Input: s = "race a car"
     Output: false
     Explanation: "raceacar" is not a palindrome.
     Example 3:

     Input: s = " "
     Output: true
     Explanation: s is an empty string "" after removing non-alphanumeric characters.
     Since an empty string reads the same forward and backward, it is a palindrome.
 */

func getAlphaNumericValue(_ s: String) -> String {
    return s.replacingOccurrences(of: "[^A-Za-z0-9]",
                                            with: "",
                                  options: [.regularExpression]).lowercased()
}

func validPalindromeReverse(_ s: String) -> Bool {
    if s.isEmpty || s.count == 1 {
        return true
    }
    let str = getAlphaNumericValue(s)
    let forward = Array(str)
    let backward = Array(String(str.reversed()))
    
    if forward.count != backward.count {
        return false
    }
    
    for i in 0..<forward.count {
        if forward[i] != backward[i] {
            return false
        }
    }
    
    return true
}

func validPalindrome2PointerOuter(_ s: String) -> Bool {
    if s.isEmpty || s.count == 1 {
        return true
    }
 
    let str = getAlphaNumericValue(s)
    let arr = Array(str)
    var left = 0
    var right = arr.count - 1
    
    while left < right {
        if arr[left] != arr[right] {
            return false
        }
        
        left += 1
        right -= 1
    }
    
    return true
}

func validPalindrome2PointerInner(_ s: String) -> Bool {
    if s.isEmpty || s.count == 1 {
        return true
    }
    let str = getAlphaNumericValue(s)
    let arr = Array(str)
    var left = arr.count / 2
    var right = arr.count / 2
    
    // if the string is even, move left pointer back by 1 so left/right are pointing at the 2 middle values respectively.
    if arr.count % 2 == 0 {
        left -= 1
    }
    
    while left >= 0 && right < arr.count {
        if arr[left] != arr[right] {
            return false
        }
        left -= 1
        right += 1
    }
    
    return true
}




let s = "A man, a plan, a canal: Panama"
//let s = "abaaba"
//let s = "abcda"
//let s = ""
//let res = validPalindromeReverse(s)
//let res = validPalindrome2PointerOuter(s)
let res = validPalindrome2PointerInner(s)
print(res)
