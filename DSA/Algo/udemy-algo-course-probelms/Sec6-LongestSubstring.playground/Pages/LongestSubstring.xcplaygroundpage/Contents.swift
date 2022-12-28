import UIKit

/*
     Given a string s, find the length of the longest
     substring without repeating characters.

     Example 1:

     Input: s = "abcabcbb"
     Output: 3
     Explanation: The answer is "abc", with the length of 3.
     Example 2:

     Input: s = "bbbbb"
     Output: 1
     Explanation: The answer is "b", with the length of 1.
     Example 3:

     Input: s = "pwwkew"
     Output: 3
     Explanation: The answer is "wke", with the length of 3.
     Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
      
     Constraints:
     0 <= s.length <= 5 * 104
     s consists of English letters, digits, symbols and spaces.
 */

// Brute force solution
func lengthOfLongestSubstringBFS(_ s: String) -> Int {
    var longestStr = 0
    var array = Array(s)

    if s.isEmpty {
       return 0
    }
    
    if array.count <= 1 {
        return 1
    }

    for i in 0..<array.count {
        var seen = [Character]()
        var maxLength = 0

        for j in i..<array.count {
            let char = array[j]
            if seen.contains(char) {
                break;
            }
            seen.append(array[j])
            maxLength += 1;
        }
        longestStr = max(longestStr, maxLength)
    }
    
    return longestStr
}

// Udemy solution
func lengthOfLongestSubstringUsingSlidingWindow(_ s: String) -> Int {
    var longest = 0
    var array = Array(s)

    if array.count <= 1 {
       return array.count
    }

    var left = 0
    var seen = [Character:Int]()

    for right in 0..<array.count {
        let currentChar = array[right]
        let prevSeenCharIndex = seen[currentChar]

        if let index = prevSeenCharIndex, index >= left {
            left = index + 1
        }

        seen[array[right]] = right
        longest = max(longest, right - left + 1 )

    }
    return longest
}


let s = "abcabcbb"
//let s = "bbbbb"
//let s = "pwwkew"
//let s = "au"
//let s = " "
//let s = ""

//let res1 = lengthOfLongestSubstringBFS(s)
//print(res1)

let res2 = lengthOfLongestSubstringUsingSlidingWindow(s)
print(res2)



//This function uses a sliding window to iterate through the input string and keeps track of the start and end indices of the current window. It maintains a set of unique characters in the current window and updates the maximum length of the substring as it goes.
//
//For example, for the input string "abcabcbb", the function would find the longest substring "abc" with length 3.

//chat gpt solution
func lengthOfLongestSubstring(s: String) -> Int {
  // Initialize a set to store unique characters of the current window
  var set = Set<Character>()

  // Initialize variables to track the start and end of the current window
  var start = 0
  var end = 0
  var maxLength = 0

  // Convert the input string to an array of characters
  let arr = Array(s)

  // While the end of the window is less than the length of the input string
  while end < arr.count {
    // If the current character is not in the set, add it and move the end of the window forward
    if !set.contains(arr[end]) {
      set.insert(arr[end])
      end += 1
      maxLength = max(maxLength, end - start)
    } else {
      // If the current character is already in the set, remove the character at the start of the window and move the start of the window forward
      set.remove(arr[start])
      start += 1
    }
  }

  return maxLength
}
