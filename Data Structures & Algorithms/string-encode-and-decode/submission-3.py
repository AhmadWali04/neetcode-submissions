class Solution:

    def encode(self, strs: List[str]) -> str:
        if not strs:
            return ""
        size, result = [],[]
        for s in strs:
            size.append(len(s))
        for i in size:
            result.append(str(i)) 
            result.append(",")
        result.append("#")
        result.extend(strs)
        return ''.join(result)

        
    def decode(self, s: str) -> List[str]:
        if not s:
            return []
        sizes,result,i = [],[],0
        while s[i] != "#":
            j = i
            while s[j] != ",":
                j +=1
            sizes.append(int(s[i:j]))
            i = j + 1
        i += 1
        for size in sizes:
            word = s[i:i+size]
            result.append(word)
            i+=size
        return result