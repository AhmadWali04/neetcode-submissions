class Solution:
    def carFleet(self, target: int, position: List[int], speed: List[int]) -> int:
        pairs = []
        fleets = []
        for i in range(len(position)):
            pair = (position[i],speed[i])
            pairs.append(pair)
        for pos, spd in sorted(pairs)[::-1]: #Reverse sorted order
            arrival = (target-pos)/spd
            fleets.append(arrival)
            if len(fleets) >= 2 and fleets[-1] <= fleets[-2]:
                fleets.pop()
        return len(fleets)
        