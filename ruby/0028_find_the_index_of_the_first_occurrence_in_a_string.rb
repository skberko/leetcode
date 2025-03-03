# 28. Find the Index of the First Occurrence in a String
# Easy
# Topics
# Companies

# Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 

# Example 1:

# Input: haystack = "sadbutsad", needle = "sad"
# Output: 0
# Explanation: "sad" occurs at index 0 and 6.
# The first occurrence is at index 0, so we return 0.

# Example 2:

# Input: haystack = "leetcode", needle = "leeto"
# Output: -1
# Explanation: "leeto" did not occur in "leetcode", so we return -1.

 

# Constraints:

#     1 <= haystack.length, needle.length <= 104
#     haystack and needle consist of only lowercase English characters.


# @param {String} haystack
# @param {String} needle
# @return {Integer}

# Note that there are other solutions that can be linear, but they are much more complicated,
# so I'm not bothering with them here.

# My initial brute force "sliding window" approach:
# O(N*M) time
def str_str(haystack, needle)
  i = 0

  while i <= haystack.length - needle.length
    if haystack[i...i + needle.length] == needle
      return i
    else
      i += 1
    end
  end

  -1
end

# ChatGPT-generated tests:
def test_str_str
  total_tests = 0
  passed_tests = 0

  # Utility method for running and checking tests
  def run_test(haystack, needle, expected, total_tests, passed_tests)
    result = str_str(haystack, needle)

    # ANSI color codes for green (pass) and red (fail)
    color = result == expected ? "\e[32m" : "\e[31m"
    reset = "\e[0m"

    puts "#{color}Test ##{total_tests + 1}"
    puts "Haystack: \"#{haystack}\""
    puts "Needle: \"#{needle}\""
    puts "Expected: #{expected}, Actual: #{result}"
    puts "Pass: #{result == expected}#{reset}"
    puts "-" * 40

    total_tests += 1
    passed_tests += 1 if result == expected

    return total_tests, passed_tests
  end

  # Test Cases
  test_cases = [
    { haystack: "hello", needle: "ll", expected: 2 },       # Normal case, match in the middle
    { haystack: "aaaaa", needle: "bba", expected: -1 },     # No match found
    { haystack: "leetcode", needle: "leeto", expected: -1 },# No match
    { haystack: "mississippi", needle: "issi", expected: 1 }, # Multiple occurrences, return first
    { haystack: "abc", needle: "c", expected: 2 },         # Match at the end
    { haystack: "abc", needle: "a", expected: 0 },         # Match at the start
    { haystack: "a", needle: "a", expected: 0 },          # Single character match
    { haystack: "a", needle: "b", expected: -1 },         # Single character no match
    { haystack: "aaa", needle: "aaaa", expected: -1 },    # Needle longer than haystack
    { haystack: "", needle: "", expected: 0 },           # Both empty
    { haystack: "abc", needle: "", expected: 0 },        # Empty needle should return 0
    { haystack: "", needle: "a", expected: -1 }          # Empty haystack, non-empty needle
  ]

  # Run all test cases
  test_cases.each do |test|
    total_tests, passed_tests = run_test(test[:haystack], test[:needle], test[:expected], total_tests, passed_tests)
  end

  # Print Summary Statistics
  puts "\n\e[34m===== Test Summary =====\e[0m" # Blue color for summary
  puts "Total Tests: #{total_tests}"
  puts "Passed Tests: \e[32m#{passed_tests}\e[0m"  # Green for passed
  puts "Failed Tests: \e[31m#{total_tests - passed_tests}\e[0m" # Red for failed
  puts "========================="
end

# Call the test function
test_str_str
