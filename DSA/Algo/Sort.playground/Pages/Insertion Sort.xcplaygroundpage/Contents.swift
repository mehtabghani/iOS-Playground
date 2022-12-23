import Foundation

/* Selection Sort */

var numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];
//var numbers = [0, 1, 2, 4, 5, 6, 44, 63, 87, 99, 283]

// i=> 1 - [44, 99, 6, 2, 1, 5, 63, 87, 283, 4, 0]
// i=> 2 - [6, 44, 99, 2, 1, 5, 63, 87, 283, 4, 0]
// i=> 3 - [2, 6, 44, 99, 1, 5, 63, 87, 283, 4, 0]


func insertionSort(numbers arr: inout [Int]) {
    let length = arr.count
    var operationsCount = 0

    for i in 1..<length {
        var currentIndex = i

        while currentIndex > 0
                && arr[currentIndex-1] > arr[currentIndex] {
            
            arr.swapAt(currentIndex, currentIndex-1)
            currentIndex -= 1
            operationsCount += 1
        }
    }
}



insertionSort(numbers: &numbers)
print(numbers)

let middleIndex = numbers.count/2
let leftHalf = Array(numbers[0..<middleIndex])
let rightHalf = Array(numbers[middleIndex..<numbers.count])
print(leftHalf)
print(rightHalf)
