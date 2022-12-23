import Foundation

/* Selection Sort */

var numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];

func selectionSort(numbers arr: inout [Int]) {
  let length = arr.count
  var min = 0

  for i in 0..<length-1 {
    min = i

    for j in i+1..<length {
     
      if arr[j] < arr[min] {
        min = j
      }
    }

    arr.swapAt(i, min)

  }
}


selectionSort(numbers: &numbers)
print(numbers)
