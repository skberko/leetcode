# 605. Can Place Flowers

# You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.

# Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return true if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule and false otherwise.

 

# Example 1:

# Input: flowerbed = [1,0,0,0,1], n = 1
# Output: true

# Example 2:

# Input: flowerbed = [1,0,0,0,1], n = 2
# Output: false

 

# Constraints:

#     1 <= flowerbed.length <= 2 * 104
#     flowerbed[i] is 0 or 1.
#     There are no two adjacent flowers in flowerbed.
#     0 <= n <= flowerbed.length

# @param {Integer[]} flowerbed
# @param {Integer} n
# @return {Boolean}
def can_place_flowers(flowerbed, n)
  free_count = 0

  i = 0
  while i < flowerbed.length
    if flowerbed[i] == 0
      empty_left_plot = (i == 0 || flowerbed[i - 1] == 0)
      empty_right_plot = (i == flowerbed.length - 1 || flowerbed[i + 1] == 0)

      if empty_left_plot && empty_right_plot
        flowerbed[i] = 1
        free_count += 1

        # Minor optimization in case we realize there are lots of
        # open spaces early on in the iteration
        return true if free_count >= n
      end
    end

    i += 1
  end

  free_count >= n
end