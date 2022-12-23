//: [Previous](@previous)

import Foundation

//: [Next](@next)


func FindIntersection(_ strArr: [String]) -> String {

    let arr1 = strArr[0].components(separatedBy: ", ")
    let arr2 = strArr[1].components(separatedBy: ", ")
    
    var result = [String]()

    for s in arr1 {
        if arr2.contains(s) {
            result.append(s)
        }
    }

    return result.joined(separator: ",")

}
var input = ["1, 3, 4, 7, 13", "1, 2, 4, 13, 15"]
FindIntersection(input)
//expected output -> "1,4,13"

input = ["1, 3, 9, 10, 17, 18", "1, 4, 9, 10"]
FindIntersection(input)
//-> 1,9,10

