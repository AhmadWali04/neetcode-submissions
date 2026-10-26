class Solution:
    def hasDuplicate(self, nums: List[int]) -> bool:
        x = set(nums)
        return len(nums) != len(x)
