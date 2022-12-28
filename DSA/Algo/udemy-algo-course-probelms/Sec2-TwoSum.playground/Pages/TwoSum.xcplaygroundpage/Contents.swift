import UIKit

/*

 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 You can return the answer in any order.
 
 Example 1:
 
 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 
 Example 2:

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 
 Example 3:

 Input: nums = [3,3], target = 6
 Output: [0,1]
 
 */

var numbers = [2,7,11,15];
let target = 9


//nums = [2,7,11,15], target = 9
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var map: [Int:Int] = [:]
        
        for i in 0..<nums.count {
            if let matchedIndex = map[nums[i]] { // i:1 -> map[7] = 0
                return [matchedIndex, i]
            }

            let ntf = target - nums[i] // i:0 -> 9-2 = 7
            map[ntf] = i // i:0 -> 7:0
        }
        
        return []
    }

let res = twoSum(numbers, target)
print(res)
