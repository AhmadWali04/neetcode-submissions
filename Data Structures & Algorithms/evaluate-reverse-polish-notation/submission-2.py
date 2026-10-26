class Solution:
    def evalRPN(self, tokens: List[str]) -> int:
        stack = []
        operators = {"+","-","*","/"}
        for token in tokens:
            #find a value, find a second value
            if token not in operators:
                stack.append(token)
            else:
                v2 = int(stack.pop())
                v1 = int(stack.pop())
                if token == "+":
                    v = v1 + v2
                if token == "-":
                    v = v1 - v2
                if token == "*":
                    v = v1 * v2
                if token == "/":
                    v = int(v1/v2)
                stack.append(v)
        return int(stack.pop())