# 169. Majority Element

# Given an array nums of size n, return the majority element.

# The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

 

# Example 1:

# Input: nums = [3,2,3]
# Output: 3

# Example 2:

# Input: nums = [2,2,1,1,1,2,2]
# Output: 2

 

# Constraints:

#     n == nums.length
#     1 <= n <= 5 * 104
#     -109 <= nums[i] <= 109

 
# Follow-up: Could you solve the problem in linear time and in O(1) space?

# @param {Integer[]} nums
# @return {Integer}

# O(n) time with O(n) space
def majority_element(nums)
  counts = Hash.new(0)
  nums.each { |num| counts[num] += 1 }

  curr_max_num = nil
  curr_max_count = 0
  counts.each do |k, v|
    curr_max_num = k if v > curr_max_count
    curr_max_count = v if v > curr_max_count
  end

  curr_max_num
end

# Boyer-Moore Voting Algorithm for O(n) time, constant space
def majority_element(nums)
  count = 0
  candidate = nil

  nums.each do |num|
    candidate = num if count == 0
    count += (num == candidate ? 1 : -1)
  end

  candidate
end
