class TimeMap {
    private var keystore : [String: [(String,Int)]]

    init() {
        self.keystore = [:]
    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        if keystore[key] == nil{
            keystore[key] = []
        }
        keystore[key]!.append((value,timestamp))
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        //use binary serach to get the value
        guard let values = keystore[key] else {return ""}
        var l = 0
        var r = values.count - 1
        var res = ""
        while l <= r{
            let m = (l + r) / 2 
            if values[m].1 <= timestamp {
                res = values[m].0
                l = m + 1
            }
            else{r = m - 1}
        }
        return res
    }
}
