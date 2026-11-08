class ListNode{
        var val : Int
        var next : ListNode?
        var prev : ListNode?

        init (_ val: Int, _ next: ListNode?, _ prev : ListNode?) {
            self.val = val
            self.next = next
            self.prev = prev
        }
    }

class MyLinkedList {

    var size = 0
    var head : ListNode?
    var tail : ListNode?

    init() {}

    private func node_at(_ index: Int)-> ListNode{
        var curr = head! //This needs an unwrap
        // guard let curr = head else {return} //But can I write it like this instead?
        // No because I need to return a ListNode
        for _ in 0..<index{
            curr = curr.next! // I wouldnt need to use the ! if I used the guard let right?
        }
        return curr
    }
    
    func get(_ index: Int) -> Int {
        guard index < size, index >= 0 else {return -1} //Could rewrite my if statement like thsi?
        // if index > size && index < 0 {return -1}
        return (node_at(index)).val
    }
    
    func addAtHead(_ val: Int) {
        let newNode = ListNode(val,head,nil)
        head?.prev = newNode //Put a ? on the headsince it can be nil
        head = newNode
        if tail == nil {tail = newNode} //edgecase I missed
        size += 1
    }
    
    func addAtTail(_ val: Int) {
        let newNode = ListNode(val,nil,tail)
        tail?.next = newNode
        tail = newNode
        if head == nil {head = newNode} // added an edgecase
        size += 1
        
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        guard index >= 0, index <= size else {return}
        if index == 0 {addAtHead(val) ; return}  // added the ;return
        if index == size {addAtTail(val) ; return} // added the ;return

        let curr = node_at(index)
        guard let prev = curr.prev else {return}
        //let prev = curr.prev //can use .prev instead of calling the O(n) node_at function 2x
        let x = ListNode(val,curr,prev)
        //These 2 lines below can be taken care of above
        //x.next = prev.next
        //x.prev = curr.prev
        prev.next = x
        curr.prev = x
        size += 1
    }
    
    func deleteAtIndex(_ index: Int) {
        guard index >= 0, index < size else {return}
        let curr = node_at (index)

        // If the previous node is not nil, have it point to the node ahead of curr
        if let p = curr.prev{
            p.next = curr.next
        } else {head = curr.next} 
        //If it is nil, then that means were at the head so update head


        // If the next node is not nil, have it point to the node behind curr
        if let n = curr.next{
            n.prev = curr.prev
        }else{tail = curr.prev}
        //Else if the next node is nil, then were at the tail. Make the new tail the last node

        // Same as before, get next and prev using .next and .prev for O(1) intead of O(n)
        //let prev = node_at(index - 1)
        //let next = node_at(index + 1)
        size -= 1
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */