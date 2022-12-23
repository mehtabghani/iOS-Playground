//: [Previous](@previous)

import Foundation

// Find  max letter repeating and return the word

func SearchingChallenge(_ str: String) -> String {

  // code goes here
  // Note: feel free to modify the return type of this function
  var dict = [String: Int]()
  var maxletterWord = ""
  var maxLetterCount = 0

    var word = ""
  //let strArr = str.components(separatedBy: " ")

  for s in str {
    
    let s = String(s)
    
    if s == " " {
        
        let max = dict.values.max() ?? 0

        if max > maxLetterCount {
            maxLetterCount = max
            maxletterWord = word

        }
        word = ""
        dict.removeAll()
        continue
    }
    
    dict[s] = (dict[s] ?? 0) + 1
    word += s

  }

  if maxLetterCount <= 1 {
      return "-1"
  }

  return maxletterWord

}

// keep this function call here
print(SearchingChallenge("Hello appple pie")); // -> "appple"
print(SearchingChallenge("Hello apple pie")); // -> Hello
print(SearchingChallenge("no words")); // -1

