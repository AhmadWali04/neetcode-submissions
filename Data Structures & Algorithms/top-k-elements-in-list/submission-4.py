class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        frequency = {}
        for num in nums:
            frequency[num] = 1 + frequency.get(num,0)
        #for i in range(len(nums)): // Bad for loop logic
        #   frequency[nums[i]] = 1 + frequency.get([nums[i]],0)

        arr = []
        for num, count in frequency.items(): # Forgot to use .items()
            arr.append([count,num]) # had these backwards
        arr.sort() # forgot to sort
        res = []
        i = 0
        while len(res) < k:
            res.append(arr.pop()[1]) # why is it [1]?
        return res