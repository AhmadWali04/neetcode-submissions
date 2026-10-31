class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var l = 0
        var r = s.count - 1
        let chars = Array(s)
        while l < r {
            while l<r && !isAlnum(chars[l]){
                l += 1
            }
            while l<r && !isAlnum(chars[r]){
                r -= 1
            }
            if chars[l].lowercased() != chars[r].lowercased(){
                return false
            }
            l += 1
            r -= 1
        }
        return true
    }

    func isAlnum(_ c: Character) -> Bool{
        return c.isLetter || c.isNumber
    }
}
