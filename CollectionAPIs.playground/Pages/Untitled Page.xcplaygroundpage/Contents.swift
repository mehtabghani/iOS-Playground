import UIKit



/**
 Reduce: The reduce method returns a single result by repeatedly calling each item in the sequence and passing a combine function to accumulate values.
 */

//adding values of sequence
var numbers = [1,2,3,4]
let sum = numbers.reduce(0, +)
print(sum)

//check all numbers are divisble by 2
numbers = [1,2,3,4]
let res = numbers.reduce(true) { (prevResult, value) -> Bool in
    return value % 2 == 0 && prevResult
}
print(res)

//check all numbers are divisble by 2
numbers = [2,4,6,8]
let res1 = numbers.reduce(true) { (prevResult, value) -> Bool in
    return value % 2 == 0 && prevResult
}
print(res1)


/**
 AllSatisfy: every element of a sequence satisfies a given predicate
 */

let rows = ["", "" , "", ""]
let isEmpty = rows.allSatisfy { $0.isEmpty }
print("row: \(isEmpty)")

let alphabets = ["abcd", "dcba" , "bcad", "acbd"]
let hasAlphabet = alphabets.allSatisfy { $0.contains("a") }
print("alphabets has A: \(hasAlphabet)")

/**
 Flatmap:
 */
let fruits = ["apple", "mango"]
let vegsFruits = [ ["carrot", "tommato", "potato"], fruits]
print("vegsFruits: \(vegsFruits)")

let resFlatArray = vegsFruits.flatMap({ $0 })
print("Flatmap: \(resFlatArray)")

let resFlatArray1 = fruits.flatMap({ $0.uppercased() })
print("Flatmap: \(resFlatArray1)")

