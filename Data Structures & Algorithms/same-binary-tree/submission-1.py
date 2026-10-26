# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

# Edge cases: trees are mismatches
class Solution:
    def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:
        #Edge cases: there is only one but tnot the other
        # There is the values but they dont match

        # Base Case
        if not p and not q:
            return True
        #RC1: they exist but mismatched values
        if p and q and (p.val==q.val):

            return self.isSameTree(p.left,q.left) and self.isSameTree(p.right,q.right)
        else:
            return False