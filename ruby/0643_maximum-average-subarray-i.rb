# 643. Maximum Average Subarray I
# Attempted
# Easy
# Topics
# Companies

# You are given an integer array nums consisting of n elements, and an integer k.

# Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.

 

# Example 1:

# Input: nums = [1,12,-5,-6,50,3], k = 4
# Output: 12.75000
# Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75

# Example 2:

# Input: nums = [5], k = 1
# Output: 5.00000

 

# Constraints:

#     n == nums.length
#     1 <= k <= n <= 105
#     -104 <= nums[i] <= 104

# @param {Integer[]} nums
# @param {Integer} k
# @return {Float}

My kind of crappy first pass, O(kn) - times out on leetcode!
def find_max_average(nums, k)
  return nums.sum.to_f / k if nums.length == k
  
  curr_max_avg = nil
  
  i = 0
  while i < nums.length - k
    if curr_max_avg.nil?
      curr_max_avg = nums[i...i + k].sum.to_f / k
    elsif nums[i...i + k].sum.to_f / k > curr_max_avg
      curr_max_avg = nums[i...i + k].sum.to_f / k
    end

    i += 1
  end

  curr_max_avg
end

# My O(n) time, O(1) space sliding window approach:
def find_max_average(nums, k)
  curr_sum = nil
  max_sum = nil

  i = 0
  while i <= nums.length - k
    if curr_sum.nil?
      curr_sum = nums[i...i + k].sum
      max_sum = curr_sum
    else
      curr_sum = curr_sum - nums[i - 1] + nums[i + k - 1]
      max_sum = curr_sum if max_sum < curr_sum
    end

    i += 1
  end

  max_sum.to_f / k
end

# ChatGPT suggests this as a more readable approach to my above sliding window approach:
def find_max_average(nums, k)
  curr_sum = nums[0...k].sum  # Compute initial window sum
  max_sum = curr_sum

  (1..nums.length - k).each do |i|
    curr_sum = curr_sum - nums[i - 1] + nums[i + k - 1]  # Slide window
    max_sum = [max_sum, curr_sum].max
  end

  max_sum.to_f / k
end