# @param {String} word1
# @param {String} word2
# @return {String}
def merge_alternately(word1, word2)
  result = ''  

  i = 0
  until word1[i].nil? && word2[i].nil?
    result += word1[i] if word1[i]
    result += word2[i] if word2[i]
  
    i += 1
  end

  result
end