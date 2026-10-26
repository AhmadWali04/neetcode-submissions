class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        seen = {}
        for i, num in enumerate(nums):
            check = target - nums[i]
            if check in seen:
                # we found it
                return [seen[check],i]
            seen[num] = i
        return []
