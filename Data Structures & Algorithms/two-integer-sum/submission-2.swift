class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
       // how do I enumerate in swift?
        var seen = [Int:Int]() 
        for (index,num) in nums.enumerated(){
            let check = target - num
            if seen[check] != nil{
                let found = seen[check]! 
                return [found,index]
            }else{
                seen[num] = index
            }
        }
        return []
    }
}
 