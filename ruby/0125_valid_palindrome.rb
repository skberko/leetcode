# 125. Valid Palindrome

# A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

# Given a string s, return true if it is a palindrome, or false otherwise.

 

# Example 1:

# Input: s = "A man, a plan, a canal: Panama"
# Output: true
# Explanation: "amanaplanacanalpanama" is a palindrome.

# Example 2:

# Input: s = "race a car"
# Output: false
# Explanation: "raceacar" is not a palindrome.

# Example 3:

# Input: s = " "
# Output: true
# Explanation: s is an empty string "" after removing non-alphanumeric characters.
# Since an empty string reads the same forward and backward, it is a palindrome.

 

# Constraints:

#     1 <= s.length <= 2 * 105
#     s consists only of printable ASCII characters.

# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  i1 = 0
  i2 = s.length - 1

  while i1 <= i2
    if s[i1] =~ /[^a-zA-Z0-9]/
      i1 += 1
    elsif s[i2] =~ /[^a-zA-Z0-9]/
      i2 -= 1
    else
      return false unless s[i1].downcase == s[i2].downcase

      i1 += 1
      i2 -= 1
    end
  end

  true
end

# ChatGPT-generated tests:
def test_is_palindrome
  total_tests = 0
  passed_tests = 0

  # Utility method for running and checking tests
  def run_test(s, expected, total_tests, passed_tests)
    result = is_palindrome(s)

    # ANSI color codes for green (pass) and red (fail)
    color = result == expected ? "\e[32m" : "\e[31m"
    reset = "\e[0m"

    puts "#{color}Test ##{total_tests + 1}"
    puts "Input: \"#{s}\""
    puts "Expected: #{expected}, Actual: #{result}"
    puts "Pass: #{result == expected}#{reset}"
    puts "-" * 40

    total_tests += 1
    passed_tests += 1 if result == expected

    return total_tests, passed_tests
  end

  # Test Cases
  test_cases = [
    { s: "A man, a plan, a canal: Panama", expected: true },  # Mixed case, spaces, punctuation
    { s: "race a car", expected: false },                    # Not a palindrome
    { s: " ", expected: true },                              # Empty string or space is a palindrome
    { s: "0P", expected: false },                            # Case sensitivity, non-alphanumeric
    { s: "aba", expected: true },                            # Simple odd-length palindrome
    { s: "abba", expected: true },                           # Simple even-length palindrome
    { s: "abcd", expected: false },                          # Completely different chars
    { s: "a.", expected: true },                             # Single character + punctuation
    { s: "12321", expected: true },                          # Numeric palindrome
    { s: "1a2", expected: false }                            # Mixed alphanumeric non-palindrome
  ]

  # Run all test cases
  test_cases.each do |test|
    total_tests, passed_tests = run_test(test[:s], test[:expected], total_tests, passed_tests)
  end

  # Print Summary Statistics
  puts "\n\e[34m===== Test Summary =====\e[0m" # Blue color for summary
  puts "Total Tests: #{total_tests}"
  puts "Passed Tests: \e[32m#{passed_tests}\e[0m"  # Green for passed
  puts "Failed Tests: \e[31m#{total_tests - passed_tests}\e[0m" # Red for failed
  puts "========================="
end

# Call the test function
test_is_palindrome