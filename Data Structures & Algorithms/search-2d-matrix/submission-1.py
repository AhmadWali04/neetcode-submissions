class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        ROWS = len(matrix)
        COLS = len(matrix[0])
        l = 0 
        r = ROWS * COLS - 1
        while l <= r:
            m = l + (r-l) // 2 
            row = m // COLS
            col = m % COLS
            if target > matrix[row][col]:
                l = m+1
            elif target < matrix[row][col]:
                r = m -1
            else:
                return True
        return False