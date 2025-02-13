# 345. Reverse Vowels of a String

# Given a string s, reverse only all the vowels in the string and return it.

# The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.

 

# Example 1:

# Input: s = "IceCreAm"

# Output: "AceCreIm"

# Explanation:

# The vowels in s are ['I', 'e', 'e', 'A']. On reversing the vowels, s becomes "AceCreIm".

# Example 2:

# Input: s = "leetcode"

# Output: "leotcede"

 

# Constraints:

#     1 <= s.length <= 3 * 105
#     s consist of printable ASCII characters.

# @param {String} s
# @return {String}
def reverse_vowels(s)
  vowels = Set.new(%w(a A e E i I o O u U))

  i1 = 0
  i2 = s.length - 1

  while i1 < i2
    while i1 < s.length && !vowels.include?(s[i1])
      i1 += 1
    end

    while i2 >= 0 && !vowels.include?(s[i2])
      i2 -= 1
    end

    if i1 < i2
      temp = s[i1].dup
      s[i1] = s[i2]
      s[i2] = temp

      i1 += 1
      i2 -= 1
    end
  end

  s
end