//: [Previous](@previous)

import Foundation


func StringChallenge(_ str: String) -> String {
    var text = ""
    
    text = str.map {
        $0.isPunctuation ? " " : String($0)
    }.joined(separator: "")
    
    let arr = text.components(separatedBy: " ")

    for (i,w) in arr.enumerated() {
        if i == 0 {
            text = w.lowercased()
            continue
        }
        
        text += w.capitalized
    }

//   print(text)
    
  return str

}

// keep this function call here
StringChallenge("cats AND*Dogs-are Awesome") // -> catsAndDogsAreAwesome
StringChallenge("a b c d-e-f%g") // ->aBCDEFG
