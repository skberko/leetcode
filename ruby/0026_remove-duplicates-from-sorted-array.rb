# 26. Remove Duplicates from Sorted Array

# Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.

# Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:

#     Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
#     Return k.

# Custom Judge:

# The judge will test your solution with the following code:

# int[] nums = [...]; // Input array
# int[] expectedNums = [...]; // The expected answer with correct length

# int k = removeDuplicates(nums); // Calls your implementation

# assert k == expectedNums.length;
# for (int i = 0; i < k; i++) {
#     assert nums[i] == expectedNums[i];
# }

# If all assertions pass, then your solution will be accepted.

 

# Example 1:

# Input: nums = [1,1,2]
# Output: 2, nums = [1,2,_]
# Explanation: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
# It does not matter what you leave beyond the returned k (hence they are underscores).

# Example 2:

# Input: nums = [0,0,1,1,1,2,2,3,3,4]
# Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
# Explanation: Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
# It does not matter what you leave beyond the returned k (hence they are underscores).

 

# Constraints:

#     1 <= nums.length <= 3 * 104
#     -100 <= nums[i] <= 100
#     nums is sorted in non-decreasing order.

# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return 0 if nums.empty?

  insert_idx = 1
  read_idx = 1

  while read_idx < nums.length
    if nums[read_idx] != nums[read_idx - 1]
      nums[insert_idx] = nums[read_idx]

      insert_idx += 1
    end

    read_idx += 1
  end

  insert_idx
end

# ChatGPT-generated tests:
def test_remove_duplicates
  total_tests = 0
  passed_tests = 0

  # Utility method for running and checking tests
  def run_test(nums, expected_nums, expected_length, total_tests, passed_tests)
    original_nums = nums.dup # Keep a copy for debugging
    length = remove_duplicates(nums)
    
    pass = (length == expected_length && nums[0, length] == expected_nums)

    # ANSI color codes: Green for pass, Red for fail
    color = pass ? "\e[32m" : "\e[31m" # Green if pass, Red if fail
    reset = "\e[0m" # Reset color

    puts "#{color}Test ##{total_tests + 1}"
    puts "Input: #{original_nums}"
    puts "Expected Length: #{expected_length}, Actual Length: #{length}"
    puts "Expected Modified Array: #{expected_nums}, Actual: #{nums[0, length]}"
    puts "Pass: #{pass}#{reset}"
    puts "-" * 40

    total_tests += 1
    passed_tests += 1 if pass

    return total_tests, passed_tests
  end

  # Test Cases
  test_cases = [
    { nums: [1, 1, 2], expected_nums: [1, 2], expected_length: 2 },
    { nums: [1, 2, 3, 4, 5], expected_nums: [1, 2, 3, 4, 5], expected_length: 5 },
    { nums: [2, 2, 2, 2, 2], expected_nums: [2], expected_length: 1 },
    { nums: [0, 0, 1, 1, 2, 2, 3, 3, 4, 4], expected_nums: [0, 1, 2, 3, 4], expected_length: 5 },
    { nums: (1..100).to_a, expected_nums: (1..100).to_a, expected_length: 100 },
    { nums: [5] * 100, expected_nums: [5], expected_length: 1 },
    { nums: (1..10).to_a, expected_nums: (1..10).to_a, expected_length: 10 },
    { nums: [], expected_nums: [], expected_length: 0 },
    { nums: [7], expected_nums: [7], expected_length: 1 }
  ]

  # Run all test cases
  test_cases.each do |test|
    total_tests, passed_tests = run_test(test[:nums], test[:expected_nums], test[:expected_length], total_tests, passed_tests)
  end

  # Print Summary Statistics
  puts "\n\e[34m===== Test Summary =====\e[0m" # Blue color for summary
  puts "Total Tests: #{total_tests}"
  puts "Passed Tests: \e[32m#{passed_tests}\e[0m"  # Green for passed
  puts "Failed Tests: \e[31m#{total_tests - passed_tests}\e[0m" # Red for failed
  puts "========================="
end

# Call the test function
test_remove_duplicates
