import UIKit

/*
 https://leetcode.com/problems/trapping-rain-water/
 Given n non-negative integers representing an elevation map
 where the width of each bar is 1, compute how much water it can
 trap after raining.
 
 */

func trap(_ height: [Int]) -> Int {
    let length = height.count
    var totalTrap = 0
    
    for i in 0..<length {
        
        var maxLeft = 0
        var maxRight = 0
        
        var p = i //1
        while p >= 0 {
            maxLeft = max(maxLeft, height[p])
            p -= 1
        }
        
        p = i
        
        while p < length {
            maxRight = max(maxRight, height[p])
            p += 1
        }
 
        let currentWater = min(maxLeft, maxRight) - height[i]
        
        if (currentWater >= 0) {
            totalTrap += currentWater
        }
        
//        print("i: \(i), min:(\(maxLeft), \(maxRight)) - height:\(height[i]), currentWater: \(currentWater), totalTrap: \(totalTrap)")
    }
    
    return totalTrap
}

var height = [0,1,0,2,1,0,3,1,0,1,2] //8
//var height = [0,1,0,2,1,0,1,3,2,1,2,1] //6
let res = trap(height)
print(res)
