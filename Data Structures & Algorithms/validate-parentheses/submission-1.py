class Solution:
    def isValid(self, s: str) -> bool:
        stack = []
        #Ensure I do not route my brackets backwards
        mp = { ")" : "(", "]" : "[", "}" : "{" }
        for c in s:
            if c in mp:
                if stack and stack[-1] == mp[c]:
                    stack.pop()
                else:
                    return False
            else:
                stack.append(c)
        if not stack:
            return True
        else:
            return False