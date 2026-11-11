class LinkedNode{
    var val : Int
    var next : LinkedNode?
    weak var prev : LinkedNode?
    
    init(_ val: Int, _ next : LinkedNode?, _ prev : LinkedNode?){
        self.val = val
        self.next = next
        self.prev = prev
    }
}

class MyLinkedList {
    //define my head and tail.
    //Best practice that these are private
    private var size = 0
    private var head : LinkedNode?
    private var tail : LinkedNode?
    init() {}

    func node_at(_ index: Int) -> LinkedNode?{
        //Return the node at index i
        // Alternatively, if were closer to the tail then loop backwards. 
        var curr = head
        for _ in 0..<index{
            curr = curr?.next
        }
        return curr
    }
    
    func get(_ index: Int) -> Int {
        // Better to use a guard statement
        // Use my node_at function and just get the value
        guard let node = node_at(index) else {return -1} 
        return node.val
    }
    
    func addAtHead(_ val: Int) {
        //handle the edgecase of where the size is 1 and now both are tail/head
        let newNode = LinkedNode(val,head,nil)
        head?.prev = newNode //optional handling
        head = newNode
        if size == 0 {tail = newNode}
        size += 1
    }
    
    func addAtTail(_ val: Int) {
        //handle edgecase of empty or whatever
        let newNode = LinkedNode(val,nil,tail)
        tail?.next = newNode
        tail = newNode
        if size == 0 {head = newNode}
        size += 1
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        guard index >= 0 && index <= size else {return} 
        if index == 0 {addAtHead(val); return}
        if index == size {addAtTail(val); return}

        guard let curr = node_at(index), let prev = curr.prev else {return}
        let newNode = LinkedNode(val,curr,prev)
        prev.next = newNode
        curr.prev = newNode
        size += 1
    }
    
    func deleteAtIndex(_ index: Int) {
        guard let curr = node_at(index) else {return}

        let prev = curr.prev
        let next = curr.next

        //if prev and next, or if just prev, or just next
        if prev != nil && next != nil{
            //removing from the middle
            prev?.next = next
            next?.prev = prev
        }
        else if prev != nil{
            prev?.next = nil
            tail = prev
            //remove from the tail
        }
        else if next != nil{
            //remove from the head
            next?.prev = nil
            head = next
        }
        curr.prev = nil // no need to optional chain anything from a guard statement
        curr.next = nil
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