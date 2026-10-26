from collections import defaultdict
from typing import List

class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        cols = defaultdict(set)
        rows = defaultdict(set)
        squares = defaultdict(set)
        
        # 'r' is the row index (0-8), 'row' is the list representing the row
        for r, row in enumerate(board):
            # 'c' is the col index (0-8), 'val' is the cell value ("1"-"9" or ".")
            for c, val in enumerate(row):
                if val == ".":
                    continue
                
                # Check for duplicates using the indices 'r' and 'c'
                if val in rows[r] or val in cols[c] or val in squares[(r // 3, c // 3)]:
                    return False
                
                rows[r].add(val)
                cols[c].add(val)
                squares[(r // 3, c // 3)].add(val)
                
        return True