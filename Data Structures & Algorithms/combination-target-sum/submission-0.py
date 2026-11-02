class Solution:
    def combinationSum(self, nums: List[int], target: int) -> List[List[int]]:
        result = []
        ### take target, minus x. That is y. See "Is there anyway to create y from the combination of nubers i have"

        def dfs(i, curr, total): 
            # three parameterse, index, curr aka subarray and total my sum
            if total == target:
                result.append(curr.copy())
                return
            if i >= len(nums) or total > target:
                return
            curr.append(nums[i])
            dfs(i,curr,total + nums[i]) # exploring the case we add
            curr.pop()
            dfs(i+1,curr,total) # exploring the case we dont add
        dfs(0,[],0)
        return result