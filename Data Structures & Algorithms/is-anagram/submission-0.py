class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False 
        countS, countT = {},{}

        for i in range(len(s)):
            countS[s[i]] = 1 + countS.get(s[i],0) # 0 just what we return if not found so we dont crash
            countT[t[i]] = 1 + countT.get(t[i],0)
        return countS == countT