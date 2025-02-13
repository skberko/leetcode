# 392. Is Subsequence

# Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

# A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

 

# Example 1:

# Input: s = "abc", t = "ahbgdc"
# Output: true

# Example 2:

# Input: s = "axc", t = "ahbgdc"
# Output: false

 

# Constraints:

#     0 <= s.length <= 100
#     0 <= t.length <= 104
#     s and t consist only of lowercase English letters.

 
# Follow up: Suppose there are lots of incoming s, say s1, s2, ..., sk where k >= 109, and you want to check one by one to see if t has its subsequence. In this scenario, how would you change your code?

## @param {String} s
# @param {String} t
# @return {Boolean}
# 
# SKB: This is my original naive (but still O(n)) answer:
def is_subsequence(s, t)
  # Index for going through the potential subsequence
  i_s = 0
  # Index for going through the original string
  i_t = 0

  # Iterate through the subsequence to see if all chars
  # can be found in order in the original string
  while i_s < s.length
    # If a char match is found, move ahead one place in
    # both subsequence and original string
    if s[i_s] == t[i_t]
      i_s += 1
      i_t += 1
    # If already past the end of the original string but
    # not at the end of the subsequence, then the subsequence
    # is not actually a subsequence
    elsif t[i_t].nil?
      return false
    else
    # If there's no char match, move to the next char in the
    # original string
      i_t += 1
    end
  end

  true
end