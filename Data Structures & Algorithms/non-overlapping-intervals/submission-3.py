class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:

        intervals.sort()
        result = 0 
        prevEnd = intervals[0][1]
        for start,end in intervals[1:]:
            if start >= prevEnd:
                # no overlap detected, increment our "previoius" for checking
                prevEnd = end 
            else:
                #overlap detected, our new previous to check against is the minimum
                result += 1
                prevEnd = min(end,prevEnd)
        return result

        