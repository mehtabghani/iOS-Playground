
/**
    Time: O(log n) -> In every itration we divide the array in half to find the target
    Space: O(1)
 */
func binarySearch(nums: [Int], target: Int) -> Int {
    var left = 0
    var right = nums.count - 1

    while (left <= right) {
        var mid = (left + right) / 2
        let foundValue = nums[mid]
        
        if foundValue == target {
            return mid
        }
        
        if foundValue < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return -1
}

let nums = [1,2,3,4,5,6,7,8,9]
let searchIndex = binarySearch(nums: nums, target: 7);
assert(searchIndex == 6)
