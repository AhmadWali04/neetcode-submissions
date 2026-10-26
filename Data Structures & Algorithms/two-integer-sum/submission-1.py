class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        seen = {}

        for index,num in enumerate(nums):
            check = target - nums[index]
            if check in seen:
                return [seen[check],index]
            seen[num] = index
        return []