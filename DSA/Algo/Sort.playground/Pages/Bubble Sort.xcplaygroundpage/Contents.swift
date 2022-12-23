import UIKit

/* Bubble Sort */

var numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];

// 99, 44 -> 44, 99
// 99, 6 -> 6, 99

func bubbleSort(numbers arr: inout [Int]){
  let length = arr.count

  for _ in 0..<length {
    for j in 0..<length-1 {

      if arr[j] > arr[j+1] {
//        let temp = arr[j]
//        arr[j] = arr[j+1]
//        arr[j+1] = temp
          arr.swapAt(j, j+1)
      }
    }
  }
}

bubbleSort(numbers: &numbers)
print(numbers)
