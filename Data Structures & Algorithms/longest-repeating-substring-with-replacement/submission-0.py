class Solution:
    def characterReplacement(self, s: str, k: int) -> int:
        #move R over while R==L, if not then use K. If 
        count = {}
        res = 0
        maxf = 0
        l = 0
        for r in range(len(s)):
            count[s[r]] = 1 + count.get(s[r],0) # add to the count
            maxf = max(maxf,count[s[r]])
            while (r-l+1) - maxf > k: #shrink the window if invalid
                count[s[l]]-=1 #decrement whatever l is at
                l+=1 #bring l over
            res = max(res,r-l+1) #
        return res