import UIKit

/*
 Given two strings s and t, return true if they are equal when both are typed into empty text editors. '#' means a backspace character.

 Note that after backspacing an empty text, the text will continue empty.

 Example 1:

 Input: s = "ab#c", t = "ad#c"
 Output: true
 Explanation: Both s and t become "ac".
 Example 2:

 Input: s = "ab##", t = "c#d#"
 Output: true
 Explanation: Both s and t become "".
 Example 3:

 Input: s = "a#c", t = "b"
 Output: false
 Explanation: s becomes "c" while t becomes "b".
 
 */

//let s = "ab#c"
//let t = "ad#c"
let s = "ab##"
let t = "c#d#"
//let s = "a#c"
//let t = "b"
//let s = "a#b#c"
//let t = "c"

let result = backspaceCompare(s, t)
print(result)

func backspaceCompare(_ s: String, _ t: String) -> Bool {
    var p1 = s.count - 1
    var p2 = t.count - 1
    var arrS = Array(s)
    var arrT = Array(t)

    while (p1 >= 0 || p2 >= 0) {
        
        if (p1 >= 0 && arrS[p1] == "#") || (p2 >= 0 && arrT[p2] == "#") {
            if p1 >= 0 && arrS[p1] == "#" {
                var backCount = 2
                while ( backCount > 0) {
                    p1 -= 1
                    backCount -= 1

                    if p1 >= 0 && arrS[p1] == "#" {
                        backCount += 2
                    }
                }
            }
            if p2 >= 0 && arrT[p2] == "#" {
                var backCount = 2
                while (backCount > 0) {
                    p2 -= 1
                    backCount -= 1

                    if p2 >= 0 && arrT[p2] == "#" {
                        backCount += 2
                    }
                }
            }
        } else {
            if p1 >= 0 && p2 >= 0 && arrS[p1] == arrT[p2] {
                p1 -= 1
                p2 -= 1
            } else {
                return false
            }
        }

    }

    return true
}


