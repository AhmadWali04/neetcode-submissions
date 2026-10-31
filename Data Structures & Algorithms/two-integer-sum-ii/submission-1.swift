class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var l = 0
        var r = numbers.count - 1
        while l < r{
            let check = numbers[l] + numbers[r]
            if check == target{
                return [l+1,r+1]
            }
            if check < target{
                l += 1
            }
            if check > target{
                r -= 1
            }
        }
        return []
    }
}
