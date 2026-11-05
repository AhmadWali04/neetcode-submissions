/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil{
            return true
        }
        return valid(root,Int.min, Int.max)
        func valid(_ node: TreeNode?, _ left : Int, _ right : Int) -> Bool{
            guard let node = node else {return true}
            //as long as
            if !(left < node.val && node.val < right){
                return false
            }
            return valid(node.left,left,node.val) && valid(node.right,node.val,right)
        }
    }
}
