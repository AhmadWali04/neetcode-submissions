class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        frequency = {}
        for num in nums:
            frequency[num] = 1 + frequency.get(num,0) 
        arr = []
        for num,count in frequency.items():
            arr.append([count,num])

        arr.sort()
        result = []
        while len(result) < k:
            result.append(arr.pop()[1])
        return result
