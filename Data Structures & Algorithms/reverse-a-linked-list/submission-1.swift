/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {

        var prev: ListNode? = nil //prev can be None or a node
        var curr = head
        while curr != nil{
            let temp = curr?.next //temp is next.
            //Use ? to treat is safely incase its nil
            curr?.next = prev
            prev = curr
            curr = temp
        }
        return prev
    }
}
