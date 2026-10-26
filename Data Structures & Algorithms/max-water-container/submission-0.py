class Solution:
    def maxArea(self, heights: List[int]) -> int:
        l, r = 0, (len(heights)-1)
        maxArea = 0
        while l<r:
            height = min(heights[l],heights[r])
            width = r - l
            area = height * width
            maxArea = max(maxArea,area)
            if heights[r] >= heights[l]:
                l+=1
            #if heights[l] > heights[r]:
            else:
                r-=1
        return maxArea