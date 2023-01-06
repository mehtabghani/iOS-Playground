import UIKit

/**
 Udemy: https://www.udemy.com/course/master-the-coding-interview-big-tech-faang-interviews/learn/lecture/22304208#content
 
 LeetCode:
 https://leetcode.com/problems/kth-largest-element-in-an-array/description/
 
 Given an integer array nums and an integer k, return the kth largest element in the array.
 Note that it is the kth largest element in the sorted order, not the kth distinct element.
 You must solve it in O(n) time complexity.

 Example 1:
 
        Input: nums = [3,2,1,5,6,4], k = 2
        Output: 5
 Example 2:

        Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
        Output: 4
  
 Constraints:

     1 <= k <= nums.length <= 105
     -104 <= nums[i] <= 104
 */

func partition(nums: inout [Int], left: Int, right: Int) -> Int {
    var pivotElement = nums[right]
    var partitionIndex = left
    
    for j in left..<right {
        if nums[j] < pivotElement {
            nums.swapAt(j, partitionIndex)
            partitionIndex += 1
        }
    }
    nums.swapAt(right, partitionIndex)
    return partitionIndex;
}
/**
 Hoare's quick select algorithm
 */
func quickSelect(nums: inout [Int], left: Int, right: Int,  indexToFind: Int) {
    guard left < right else {
        return
    }
    
    var partitionIndex = partition(nums: &nums, left: left, right: right)
    
    if indexToFind == partitionIndex {
        return
    }
    
    if indexToFind < partitionIndex {
        return quickSelect(nums: &nums, left: left, right: partitionIndex - 1, indexToFind: indexToFind)
    } else {
        return quickSelect(nums: &nums, left: partitionIndex + 1, right: right, indexToFind: indexToFind)
    }
}
/**
    Time Complexity:
    - Worst case: O(n^2) -> when array is ordered but in descending format.
    - Best case: O(n)
    Space Complexity:
    - O(1) -> Due to tail recursion nothing is stored on call stack.
 */
func findKthElement(nums: [Int], k: Int) -> Int? {
    var data = nums
    let indexToFind = nums.count - k
    quickSelect(nums: &data,
                       left: 0,
                       right: nums.count - 1,
                       indexToFind: indexToFind)
    return data[indexToFind]

}

var nums = [5,3,1,6,4,2]
var result = findKthElement(nums: nums, k: 2)
assert(result == 5)

nums = [3,2,3,1,2,4,5,5,6]
result = findKthElement(nums: nums, k: 4)
assert(result == 4)
