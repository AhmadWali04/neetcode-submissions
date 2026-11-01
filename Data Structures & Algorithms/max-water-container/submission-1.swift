class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        //height is min of the two bars
        //length is r - l
        // area = length * height
        // start l at 0, r at the opposite end.
        // check for the area. If l is shorter, bring l in. If r is shorter, bring r in.
        // check for the maxArea.

        var l = 0
        var r = heights.count - 1
        var maxArea = 0
        while l < r{
            let height = min(heights[l] , heights[r])
            let length = r - l
            let area = length * height
            maxArea = max(area,maxArea)
            if heights[l] < heights[r]{
                l += 1
            }
            else{
                r -= 1
            }
        }
        return maxArea
    }
}
