file_data = File.read("prod.txt")

split_data = file_data.split("\n")

UPPERLETTERS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
LOWERLETTERS = ''

def split_string(text)
  midpoint = text.length / 2
  [text[0...midpoint],text[midpoint...text.length]]

end

def common_letters(text)
  textToCompare = split_string(text)
  common_letters = []
  textToCompare[0].each_char do |ele|
    if textToCompare[1].include?(ele)
      common_letters << ele
    end
  end

  if common_letters.length > 1
    common_letters.uniq!
  else
    common_letters
  end

end

def priorities(array_of_letters)

  score = 0
  array_of_letters.each do |ele|
    score += UPPERLETTERS.index(ele).to_i 

  end


  score += 1
end

total_score = 0

split_data.each do |ele|
  total_score +=  priorities(common_letters(ele))
end

p total_score