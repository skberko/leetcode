# 283. Move Zeroes

# Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

# Note that you must do this in-place without making a copy of the array.

 

# Example 1:

# Input: nums = [0,1,0,3,12]
# Output: [1,3,12,0,0]

# Example 2:

# Input: nums = [0]
# Output: [0]

 

# Constraints:

#     1 <= nums.length <= 104
#     -231 <= nums[i] <= 231 - 1

 
# Follow up: Could you minimize the total number of operations done?

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  # Two pointers:
  # Reader moves ahead and checks for non-0 vals, then writes them to
  # the current position of writer, bumping writer to the next position
  # in the array if the current reader value is non-0.
  # Once reader has reached the end of the array, writer comes in and
  # writes 0 to any remaining places in the array.

  reader = 0
  writer = 0

  while reader < nums.length
    if nums[reader] != 0
      nums[writer] = nums[reader]
      writer += 1
    end

    reader += 1
  end

  while writer < nums.length
    nums[writer] = 0
    writer += 1
  end
end