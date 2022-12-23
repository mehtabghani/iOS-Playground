//: [Previous](@previous)

import Foundation

func addBinary(_ b1: String, _ b2: String) -> String {
    
    let a = Array(b1)
    let b = Array(b2)
    var i = a.count - 1
    var j = b.count - 1
    var res = ""
    var carry = 0
    var sum = 0
    
    while i >= 0 || j >= 0 {
        sum = carry
    
        if i >= 0 { sum += Int( String( a[i]) )! }
        if j >= 0 { sum += Int( String( b[j]) )! }
                
        res += String(sum%2)
        carry = sum/2
        i -= 1
        j -= 1
    }
          
    if carry > 0 { res += "1" }

    res = String(res.reversed())
    return res
}

addBinary("10", "11") //= 101

/*
1
 10
 11
-----
101
*/

addBinary("111", "111") //= 1110

/*
   111
    111
    111
 ----------
   1110
 
 */
