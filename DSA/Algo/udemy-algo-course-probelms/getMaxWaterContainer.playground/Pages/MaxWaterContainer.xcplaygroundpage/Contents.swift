import UIKit

/*

 problem: https://leetcode.com/problems/container-with-most-water/
 
 [7,1,2,3,9]
  i,j
 
 maxArea = min(i,j) * j-i
 */



/*
 Brute force solution
 time: O(n^2)
 space: O(1)
*/

//func getMaxWaterContainer(_ nums: [Int]) -> Int {
//    var maxArea = 0
//
//    if nums.isEmpty {
//        return 0
//    }
//
//    for i in 0..<nums.count-1 {
//        for j in i+1..<nums.count {
//
//            let length  = min(nums[i], nums[j])
//            let width = j-i
//            let area = length*width
//            maxArea = max(area, maxArea)
//        }
//    }
//
//    return maxArea
//}

/*
 Optimized solution
 time: O(n)
 space: O(1)
*/
func getMaxWaterContainer(_ nums: [Int]) -> Int {
    var maxArea = 0
    var p1 = 0
    var p2 = nums.count-1
    
    while (p1 < p2) {
        let length = min(nums[p1], nums[p2])
        let width = p2 - p1
        let area = length * width
        
        maxArea = max(area, maxArea)
        
        if (p1 < p2) {
            p1 += 1
        } else {
            p2 -= 1
        }
        
        if(nums[p1] <= nums[p2]) {
            p1 += 1
        } else {
            p2 -= 1
        }
    }
    return maxArea
}

var numbers = [7,1,2,3,9]; //max: 28
//var numbers = [1,8,6,2,5,4,8,3,7] //max: 49
// var numbers = [7];
// var numbers = [1,1]
// var numbers = [];

let res = getMaxWaterContainer(numbers)
print(res)
