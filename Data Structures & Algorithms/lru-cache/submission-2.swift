//create my linked list, and create my linked node

class LinkedNode {
    var key : Int
    var val : Int
    var next : LinkedNode? //shouldve been var
    var prev : LinkedNode?

    init(_ val : Int, _ key : Int){
        self.val = val
        self.key = key

    }
}

/*
head and tail don’t exist in LRUCache. They belong to your LinkedList class, and you never create an instance of it. The simplest fix is to put head and tail directly on LRUCache and delete the LinkedList class.
*/

class LRUCache {
    private var size = 0
    private var map : [Int:LinkedNode] = [:] //key -> node storing value
    private var head : LinkedNode? //Least Recent
    private var tail : LinkedNode?  //Most Recent
    private let capacity : Int

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    private func remove(_ node : LinkedNode){
        //must be an if let not just a let node = node?.next because
        // I need to update the pointers of prev and next afterwards

        //If there is a previous node. Else if there isnt that node was the head so increment head. Vice Versa
        if let prev = node.prev{
            prev.next = node.next
        } else {head = node.next}
        if let next = node.next{
            next.prev = node.prev
        } else {tail = node.prev}

        node.next = nil
        node.prev = nil
    }

    private func addToTail(_ node : LinkedNode){
        //pass in a node instead of node params like value and key
        node.prev = tail
        node.next = nil
        tail?.next = node
        tail = node
        if head == nil {head = node}
        return
    }

    func get(_ key: Int) -> Int {
        guard let node = map[key] else {return -1}
        remove(node)
        addToTail(node)
        return node.val
    }

    func put(_ key: Int, _ value: Int) {
        //if it exists in our thing, just update the value
        if let node = map[key]{
            node.val = value
            remove(node)
            addToTail(node)
            return
        }

        //If we are at max capcity, fetch the least recently used (head)
        //remove the LRU, and then destroy the hashmap pointing to it
        if map.count == capacity, let LRU = head{
            remove(LRU)
            map[LRU.key] = nil
        }

        //Otherwise we are inserting a new value and cache isnt full
        let node = LinkedNode(value,key)
        addToTail(node)
        map[key] = node
    }
}
