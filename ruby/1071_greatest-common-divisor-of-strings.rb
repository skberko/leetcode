# https://leetcode.com/problems/greatest-common-divisor-of-strings/
# 
# @param {String} str1
# @param {String} str2
# @return {String}

# Brute force method
def gcd_of_strings(str1, str2)
  # TODO
end

# Optimal solution: O(m + n)
def gcd_of_strings2(str1, str2)
  # handles the case where there is no divisible string
  return '' unless str1 + str2 == str2 + str1

  # cases where there is a divisible string

  # if the two strings share a divisible string, then
  # it must be of the length of the greatest common divisor
  # of the length of the two strings
  gcd = str1.length.gcd(str2.length)
  str1[0...gcd]
end