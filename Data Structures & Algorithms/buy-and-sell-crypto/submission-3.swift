class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var l = 0
        var r = 1
        var maxProfit = 0

        while r < prices.count{
            if prices[l] < prices[r]{
                maxProfit = max(maxProfit, prices[r] - prices[l])
            } else {
                l = r
            }
            r += 1
        }
        return maxProfit
    }
}
