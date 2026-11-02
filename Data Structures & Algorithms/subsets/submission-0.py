class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        res = []
        subset = []
        def dfs(i):
            #Q1: When do I have a complete answer?
            if i>=len(nums): #If we have a value greater than len nums
                res.append(subset.copy())
                return
            
            subset.append(nums[i])#Add the next value
            dfs(i+1)
            subset.pop()#pop means going back
            dfs(i+1)
        dfs(0)
        return res