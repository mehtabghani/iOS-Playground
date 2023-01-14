import UIKit

/**
 Udemy: https://www.udemy.com/course/master-the-coding-interview-big-tech-faang-interviews/learn/lecture/22304218#content
 
 LeetCode:
 https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
 
 Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

 If target is not found in the array, return [-1, -1].

 You must write an algorithm with O(log n) runtime complexity.

 Example 1:
     Input: nums = [5,7,7,8,8,10], target = 8
     Output: [3,4]
 Example 2:
     Input: nums = [5,7,7,8,8,10], target = 6
     Output: [-1,-1]
 Example 3:
    Input: nums = [], target = 0
    Output: [-1,-1]

 Constraints:
     0 <= nums.length <= 105
     -109 <= nums[i] <= 109
     nums is a non-decreasing array.
     -109 <= target <= 109
 */

func binarySearch(nums: [Int], start: Int, end: Int, target: Int) -> Int {
    
    /* Recursion */
    if start > end {
        return -1
    }
    
    let mid = (start + end) / 2
    let foundValue = nums[mid]
    
    if foundValue == target {
        return mid;
    }
    
    if target < foundValue {
        return binarySearch(nums: nums, start: start, end: mid-1, target: target)
    } else {
        return binarySearch(nums: nums, start: mid+1, end: end, target: target)
    }
    
    /* Through loop */
    
    //    var left = start
    //    var right = end
    //
    //    while left <= right {
    //       let mid = (left + right) / 2;
    //       let foundVal = nums[mid]
    //
    //        if foundVal == target {
    //         return mid;
    //       } else if foundVal < target {
    //           left = mid + 1
    //       } else {
    //         right = mid - 1
    //       }
    //     }
    //
    //     return -1;
}

/**
    Time: O(logn)
    Space: O(1)
 */
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    
    var firstPos = binarySearch(nums: nums, start: 0, end: nums.count-1, target: target)
    
    if firstPos == -1 {
        return [-1,-1]
    }
    
    var temp = firstPos
    var startPos = firstPos
    var endPos = firstPos
    
    while startPos != -1 {
        temp = startPos
        startPos -= 1
        startPos = binarySearch(nums: nums, start: 0, end: startPos, target: target)
    }
    firstPos = temp
    
    while endPos != -1 {
        temp = endPos
        endPos += 1
        endPos = binarySearch(nums: nums, start: endPos, end: nums.count-1, target: target)
    }
    endPos = temp
    
    return [firstPos, endPos]
}

//var arr = [5,7,7,8,8,10]
//var res = binarySearch(nums: arr, start: 0, end: arr.count-1, target: 8)
//print(res)

var nums = [5,7,7,8,8,10]
var result = searchRange(nums, 8);
assert(result == [3,4])

nums = [5,7,7,8,8,10]
result = searchRange(nums, 6);
assert(result == [-1,-1])
