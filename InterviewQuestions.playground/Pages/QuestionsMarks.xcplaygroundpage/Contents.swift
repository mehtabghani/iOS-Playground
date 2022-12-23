//: [Previous](@previous)

import Foundation

func QuestionsMarks(_ str: String) -> Bool {

  var questionMarkCount = 0
  var foundNumber: Int?


    for s in str {

    if foundNumber != nil {
        
        if s == "?" {
          questionMarkCount += 1
          continue
        }

        if let num = Int(String(s)), let lastNum = foundNumber {
            let sum = num + lastNum
            if sum == 10  && questionMarkCount == 3 {
               return true
            }
        }

        continue
    }

    if let num = Int(String(s)) {
        foundNumber = num
    }
  }

  return false

}

// keep this function call here
print(QuestionsMarks("aa6?9"));
print(QuestionsMarks("acc?7??sss?3rr1??????5"));

