import UIKit

/*
 https://leetcode.com/problems/trapping-rain-water/
 Given n non-negative integers representing an elevation map
 where the width of each bar is 1, compute how much water it can
 trap after raining.
 
 Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.
 
 */

func trap(_ height: [Int]) -> Int {
    var totalTrap = 0 //1
    var maxLeft = 0 //1
    var maxRight = 0
    var pLeft = 0 //3
    var pRight = height.count - 1
    
    var i = 0 // just for logging
    
    while (pLeft != pRight) {
        let leftSmaller = height[pLeft] <= height[pRight] //3,2
        
        if leftSmaller {
            if (maxLeft <= height[pLeft]) {// 2,1
                maxLeft = height[pLeft]
            } else {
                totalTrap += (maxLeft - height[pLeft]) //1-0
            }
            pLeft += 1
        }
        else {
            if (maxRight <= height[pRight]) {// 0,2
                maxRight = height[pRight]
            } else {
                totalTrap += (maxRight - height[pRight])
            }
            pRight -= 1
        }
        
        let leftSmallerStr = leftSmaller ? "yes" : "no"
        
//        print("i: \(i) -- pLeft: \(pLeft), pRight: \(pRight), leftSmaller: \(leftSmallerStr), maxLeft:\(maxLeft), maxRight: \(maxRight), totalTrap: \(totalTrap)")
        i += 1 //3
    }
    return totalTrap
}

//var height = [0,1,0,2,1,0,3,1,0,1,2] //Ans: 8
var height = [0,1,0,2,1,0,1,3,2,1,2,1] //Ans: 6
let res = trap(height)
print(res)
