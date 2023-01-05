//: [Previous](@previous)

import Foundation
/**
    Quick Sort
    Time Complexity: O(nlogn)
    Space complexity: O(logn)
 */

func quickSort(arr: inout [Int], left: Int, right: Int) {
    if (left >= right) {
        return
    }
    
    var partitionIndex = partition(arr: &arr, left: left, right: right)
//    print(partitionIndex)
//    print(arr)
    quickSort(arr: &arr, left: left, right: partitionIndex - 1)
    quickSort(arr: &arr, left: partitionIndex + 1, right: right)
}

func partition(arr: inout [Int], left: Int, right: Int) -> Int {
    var pivotElement = arr[right]
    var partitionIndex = left
    
    for j in left..<right {
        
        if arr[j] < pivotElement {
            arr.swapAt(j, partitionIndex)
            partitionIndex += 1
        }
    }
    
    arr.swapAt(partitionIndex, right)
    return partitionIndex;
}

var arr = [5,3,4,2,6,1]
quickSort(arr: &arr, left: 0, right: arr.count-1)
//print(arr)
