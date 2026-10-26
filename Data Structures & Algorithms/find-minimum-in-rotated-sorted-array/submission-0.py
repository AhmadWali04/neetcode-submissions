class Solution:
    def findMin(self, nums: List[int]) -> int:
        l, r = 0, len(nums)-1
        while l < r:
            m = l + (r - l) //2
            if nums[m] < nums[r]: 
                #if the number to the right is bigger, jump to m to find the smaller window
                r = m
            else: 
                l = m+1
        return nums[l]            