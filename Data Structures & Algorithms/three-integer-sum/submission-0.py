from typing import List

class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        result = []
        nums.sort()  # Sorting allows us to use two pointers and easily skip duplicates

        # Initialize outer loop pointer
        i = 0
        n = len(nums)

        while i < n:
            a = nums[i]

            # Optimization: Since nums is sorted, if 'a' is positive, 
            # no two numbers after it can sum to 0 with 'a'.
            if a > 0:
                break

            # Skip duplicate values for the first element ('a') to avoid duplicate triplets
            if i > 0:
                if a == nums[i - 1]:
                    i = i + 1  # Increment pointer before continuing
                    continue

            # Set up the two pointers
            left = i + 1
            right = n - 1

            while left < right:
                current_sum = a + nums[left] + nums[right]

                # If sum is too large, move the right pointer left to decrease the sum
                if current_sum > 0:
                    right = right - 1

                # If sum is too small, move the left pointer right to increase the sum
                elif current_sum < 0:
                    left = left + 1

                # Found a valid triplet that sums to 0
                else:
                    result.append([a, nums[left], nums[right]])

                    # Move both pointers to look for other potential pairs with 'a'
                    left = left + 1
                    right = right - 1

                    # Skip duplicate values for the second element ('nums[left]')
                    while left < right:
                        if nums[left] == nums[left - 1]:
                            left = left + 1
                        else:
                            break

            # Increment outer pointer for the next iteration
            i = i + 1

        return result